import luigi
import luigi.scheduler
import luigi.worker

from components import *


class MyWorkflow(luigi.Task):


'''
An example luigi workflow task, which runs a whole workflow of other luigi
tasks when executed.
'''
# Here we define the whole workflow in the requires function
def requires(self):


task_a = TaskA()
task_b = TaskB(upstream_task=task_a)
task_c = TaskC(upstream_task=task_b)
return task_c

# Define a simple marker file to show that the workflow has completed


def output(self):


return luigi.LocalTarget(self.input().path + '.workflow_complete')

# Just write some text to the marker file


def run(self):


with self.output().open('w') as outfile:
outfile.write('Workflow complete!')


# If this file is executed as a script, let luigi take care of it:
if __name__ == '__main__':
luigi.run()
