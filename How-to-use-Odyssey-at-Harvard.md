## Use GPU
### Load CUDA
`module load cuda/9.0-fasrc02 cudnn/7.0_cuda9.0-fasrc01`

## Connect
### 1. Use Jupyter Lab
##### On Odyssey:

request resource

`srun --pty -p seas_dgx1_priority -t 1-00:00 --mem 30000 --gres=gpu:1 /bin/bash`

set prot of Jupyter Lab

`export myport=12345`

remeber this output

`echo "ssh -NL $myport:$(hostname):$myport $USER@login.rc.fas.harvard.edu"`

for example, we get this

`ssh -NL 12345:seasdgx104.rc.fas.harvard.edu:12345 simonx@login.rc.fas.harvard.edu`

##### On local machine

run command from above

`ssh -NL 12345:seasdgx104.rc.fas.harvard.edu:12345 simonx@login.rc.fas.harvard.edu`

input your passward and re-password


##### Lunch App

use this to lunch Jupyter Lab on Odyssey

`jupyter lab --no-browser --port=$myport --ip='0.0.0.0'`

then input proper url on your local browser 

`http://127.0.0.1:12345`


### 2. Use Virtual Desktop
[How-to](https://www.rc.fas.harvard.edu/resources/documentation/virtual-desktop/)

### Issues

Issues:
`2018-10-07 12:40:45.846093: I tensorflow/stream_executor/dso_loader.cc:141] Couldn't open CUDA library libcupti.so.9.0. LD_LIBRARY_PATH: /usr/local/cuda-9.0/lib64 2018-10-07 12:40:45.846370: F tensorflow/stream_executor/lib/statusor.cc:34] Attempting to fetch value instead of handling error Failed precondition: could not dlopen DSO: libcupti.so.9.0; dlerror: libcupti.so.9.0: cannot open shared object file: No such file or directory`

Solution:
`export LD_LIBRARY_PATH="/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/extras/CUPTI/lib64"`
