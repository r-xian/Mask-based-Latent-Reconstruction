#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=25G
#SBATCH --job-name=MLR_cheetah
#SBATCH --gres=gpu:a100
#SBATCH --time=24:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o cheetah.out
#SBATCH -e cheetah.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate mlr
cd /scratch/user/s4642506/Mask-based-Latent-Reconstruction/src

srun CUDA_VISIBLE_DEVICES=0 python ./train.py --config-path ./configs --config-name cheetah_run jumps=15 seed=1 num_env_steps=100000 work_dir=output wandb=false agent=mtm_sac 


# task=finger_spin
# task=reacher_easy
# task=cartpole_swingup
# task=cheetah_run
# task=walker_walk
# task=cup_catch
