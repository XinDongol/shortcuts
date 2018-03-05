## How to use a remote Jupyter Notebook
#####On the remote server

	jupyter notebook --no-browser --port=1234
Optional: start the notebook in tmux or screen so that you can later close the terminal while be able to run the notebook (e.g. if you are runing a lon task).

#####On the local machine
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

## GPU Server
| Name        | Address          | 
| ------------- |:-------------:|
| gpu1      | 192.168.65.21 | 
| gpu2      | 192.168.65.22      |  
| gpu3 | 192.168.65.23     |   
| gpu4 | 192.168.65.104     |  
| gpu5 | 192.168.65.121     |  
