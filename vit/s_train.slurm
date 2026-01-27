#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --job-name=test
#SBATCH --output=log_training.log

# export MASTER_PORT=$(get_free_port)
# export MASTER_PORT=$(expr 10000 + $(echo -n $SLURM_JOBID | tail -c 4))
export MASTER_PORT=12355
echo "MASTER_PORT"=$MASTER_PORT

# export WORLD_SIZE=$(($SLURM_NNODES * $SLURM_NTASKS_PER_NODE))
# echo "WORLD_SIZE="$WORLD_SIZE

# master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
# export MASTER_ADDR=$master_addr
export MASTER_ADDR=localhost
echo "MASTER_ADDR="$MASTER_ADDR

uv run train.py --data-path /media/disk/vista/BBDD_video_image/imagenet_complete/ILSVRC/Data/CLS-LOC/
