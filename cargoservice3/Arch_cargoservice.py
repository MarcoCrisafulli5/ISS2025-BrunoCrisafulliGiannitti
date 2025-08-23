### conda install diagrams
from diagrams import Cluster, Diagram, Edge
from diagrams.custom import Custom
import os
os.environ['PATH'] += os.pathsep + 'C:/Program Files/Graphviz/bin/'

graphattr = {     #https://www.graphviz.org/doc/info/attrs.html
    'fontsize': '22',
}

nodeattr = {   
    'fontsize': '22',
    'bgcolor': 'lightyellow'
}

eventedgeattr = {
    'color': 'red',
    'style': 'dotted'
}
evattr = {
    'color': 'darkgreen',
    'style': 'dotted'
}
with Diagram('cargoserviceArch', show=False, outformat='png', graph_attr=graphattr) as diag:
  with Cluster('env'):
     sys = Custom('','./qakicons/system.png')
### see https://renenyffenegger.ch/notes/tools/Graphviz/attributes/label/HTML-like/index
     with Cluster('ctxcargoholdservice', graph_attr=nodeattr):
          cargo1=Custom('cargo1','./qakicons/symActorWithobjSmall.png')
          cargohold=Custom('cargohold','./qakicons/symActorWithobjSmall.png')
     with Cluster('ctxsonarservice', graph_attr=nodeattr):
          sonar=Custom('sonar(ext)','./qakicons/externalQActor.png')
     with Cluster('ctxbasicrobot', graph_attr=nodeattr):
          cargorobot=Custom('cargorobot(ext)','./qakicons/externalQActor.png')
     with Cluster('ctxcargoservice', graph_attr=nodeattr):
          productservice=Custom('productservice(ext)','./qakicons/externalQActor.png')
     cargo1 >> Edge(color='blue', style='solid',  decorate='true', label='<msg1 &nbsp; >',  fontcolor='blue') >> sonar
     cargo1 >> Edge(color='blue', style='solid',  decorate='true', label='<msg1 &nbsp; >',  fontcolor='blue') >> cargohold
     cargohold >> Edge(color='blue', style='solid',  decorate='true', label='<msg1 &nbsp; >',  fontcolor='blue') >> cargo1
diag
