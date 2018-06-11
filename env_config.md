## How to use a remote Jupyter Notebook
##### On the remote server

	jupyter notebook --no-browser --port=1234
Optional: start the notebook in tmux or screen so that you can later close the terminal while be able to run the notebook (e.g. if you are runing a lon task).

##### On the local machine
Create an ssh tunnel to the corresponding server and binding remote port XXXX to local YYYY:

	ssh -f xdong@192.168.65.121 -L 1234:localhost:1234 -N
You can now enter 

	localhost:[YYYY] 
in your favorite browser to use the remote notebook!


## Use TF with virtualenv in Jupyter
1. Install the ipython kernel module into your virtualenv
```
activate your virtualenv
pip install ipykernel
```
2. Now run the kernel "self-install" script:
```
python -m ipykernel install --user --name=my-virtualenv-name
```
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

## GPU Server
| Name        | Address          | 
| ------------- |:-------------:|
| gpu1      | 192.168.65.21 | 
| gpu2      | 192.168.65.22      |  
| gpu3 | 192.168.65.23     |   
| gpu4 | 192.168.65.104     |  
| gpu5 | 192.168.65.121     |  
