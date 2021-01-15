# diagram.py
from diagrams import Cluster, Diagram
from diagrams.aws.integration import MQ


with Diagram("Message Queue", show=False):


     with Cluster("Security Group"):
          MQ("Queue")
