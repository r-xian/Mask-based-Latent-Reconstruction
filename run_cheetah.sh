#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --job-name=MLR_finger
#SBATCH --gres=gpu:a100
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o finger.out
#SBATCH -e finger.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate mlr
cd /home/s4642506/Mask-based-Latent-Reconstruction/DMControl/src

srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=1 agent=mtm_sac num_env_steps=100000 work_dir=output wandb=false 


# task=finger_spin
# task=reacher_easy
# task=cartpole_swingup
# task=cheetah_run
# task=walker_walk
# task=cup_catch
