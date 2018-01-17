## Only use CPU
```Python
import os
os.environ['CUDA_VISIBLE_DEVICES'] = ''
```
or 
```Python
%env CUDA_VISIBLE_DEVICES=5 # must be in iPython
```

## Allow GPU memory growth
```Python
gpu_options=tf.GPUOptions(allow_growth=False)
config=tf.ConfigProto(gpu_options=gpu_options)
```
