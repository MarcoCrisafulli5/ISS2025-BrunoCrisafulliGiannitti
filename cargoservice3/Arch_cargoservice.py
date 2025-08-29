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
     with Cluster('ctxusermock', graph_attr=nodeattr):
          user=Custom('user(ext)','./qakicons/externalQActor.png')
     with Cluster('ctxcargoholdservice', graph_attr=nodeattr):
          cargoservice=Custom('cargoservice','./qakicons/symActorWithobjSmall.png')
          hold=Custom('hold','./qakicons/symActorWithobjSmall.png')
     with Cluster('ctxsonarled2025', graph_attr=nodeattr):
          sonardevice=Custom('sonardevice(ext)','./qakicons/externalQActor.png')
     with Cluster('ctxbasicrobot', graph_attr=nodeattr):
          cargorobot=Custom('cargorobot(ext)','./qakicons/externalQActor.png')
     with Cluster('ctxcargoservice', graph_attr=nodeattr):
          productservice=Custom('productservice(ext)','./qakicons/externalQActor.png')
     sys >> Edge( label='sonardata', **evattr, decorate='true', fontcolor='darkgreen') >> cargoservice
     cargoservice >> Edge(color='magenta', style='solid', decorate='true', label='<getProduct<font color="darkgreen"> getProductAnswer</font> &nbsp; >',  fontcolor='magenta') >> productservice
     cargoservice >> Edge(color='magenta', style='solid', decorate='true', label='<holdrequest<font color="darkgreen"> holdreply holdreplyfailed</font> &nbsp; >',  fontcolor='magenta') >> hold
     cargoservice >> Edge(color='magenta', style='solid', decorate='true', label='<moverobot<font color="darkgreen"> moverobotdone moverobotfailed</font> &nbsp; >',  fontcolor='magenta') >> cargorobot
     user >> Edge(color='magenta', style='solid', decorate='true', label='<requesttoload<font color="darkgreen"> requesttoloadreply</font> &nbsp; >',  fontcolor='magenta') >> cargoservice          
     hold >> Edge(color='blue', style='solid',  decorate='true', label='<msg1 &nbsp; >',  fontcolor='blue') >> cargoservice
diag
