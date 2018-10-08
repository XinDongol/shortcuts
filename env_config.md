## How to use a remote Jupyter Notebook
##### On the remote server

	jupyter notebook --no-browser --port=1234
Optional: start the notebook in tmux or screen so that you can later close the terminal while be able to run the notebook (e.g. if you are runing a lon task).

##### On the local machine
Create an ssh tunnel to the corresponding server and binding remote port XXXX to local YYYY:

	ssh -f xdong@192.168.65.121 -L 1234:localhost:1234 -N
If th port was in use:

	lsof -ti:5901 | xargs kill -9

You can now enter 

	localhost:[YYYY] 
in your favorite browser to use the remote notebook!

## SSh through firewall without VPN
`ssh -R myalias:22:localhost:22 serveo.net`
[link](https://serveo.net/#manual)

## Use Tensorboard
`ssh -R remotetb:80:localhost:6006 serveo.net`

[jupyter-tensorboard](https://github.com/lspvic/jupyter_tensorboard)

## Run it without hold 1
```
CUDA_VISIBLE_DEVICES=4,5,6,7 nohup python main_mild_first_model.py --retrain_epochs 10 >mild.out 2>&1&
```
## Run it without hold 2
| CMD        | Func          | 
| ------------- |:-------------:|
| screen -S your_name     | build a session | 
| Ctrl+a d      | detach s seesion      |  
| screen -D pid.sessionname | detach remotely     |   
| screen -r pid.sessionname | resume remotely     |  


## Plot in Remote Server
```Python
from PyQt5 import QtCore, QtGui, QtWidgets
#import cv2
import tensorflow
import matplotlib

matplotlib.use('Qt5Agg')  # if you do not want to use GUI, just use 'Agg'
import matplotlib.pyplot as plt
#plt.switch_backend('agg')
import numpy as np

print("Tensorflow Imported")
plt.plot(np.arange(100))
plt.show()
plt.savefig('test.png')
plt.close()
```
## Use docker
`sudo nvidia-docker run -it --ipc=host -v /home/simonx/Documents/Imagenet:/codes -v /media/simonx/ssdl/lmdb_imagenet:/data ufoym/deepo bash` 

## Enable X11-forward in Mac
In `~/.ssh/config`

	ForwardAgent yes
	ForwardX11 yes
	Compression yes
	XAuthLocation /opt/X11/bin/xauth

## Only use CPU
```Python
import os
os.environ['CUDA_VISIBLE_DEVICES'] = ''
```
or 
```Python
%env CUDA_VISIBLE_DEVICES=5 # must be in iPython
```

## Allow GPU memory growth (in Tensorflow)
```Python
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
config.gpu_options.visible_device_list = "0"
session = tf.Session(config=config)
```

## Allow GPU memory growth (in Keras)
```Python
if 'tensorflow' == K.backend():
	import tensorflow as tf
	from keras.backend.tensorflow_backend import set_session
	config = tf.ConfigProto()
	config.gpu_options.allow_growth = True
	config.gpu_options.visible_device_list = "0"
	#session = tf.Session(config=config)
	set_session(tf.Session(config=config))
```
## Run with rlaunch
	rlaunch --cpu=1 --gpu=1 --memory=4096 -- python train.py	
## Use Tensorboard on Brain++
	ssh -N -f -L localhost:8888:localhost:6006 simonx.dongxin02.brw@wh-a-internal.brainpp.cn
	
## Transfer Large Filer
  	rsync -rtu --delete --progress file1 file2 user@remotemachine:/destination/directory   # from local to server

## Connect to server through a gateway or two
	ssh -tt vivek@Jumphost ssh -tt vivek@FooServer
[details](https://www.cyberciti.biz/faq/linux-unix-ssh-proxycommand-passing-through-one-host-gateway-server/)
## GPU Server
| Name        | Address          | 
| ------------- |:-------------:|
| gpu1      | 192.168.65.21 | 
| gpu2      | 192.168.65.22      |  
| gpu3 | 192.168.65.23     |   
| gpu4 | 192.168.65.104     |  
| gpu5 | 192.168.65.121     |  


[twGPU](https://gpu.iis.sinica.edu.tw )
