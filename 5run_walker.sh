#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30G
#SBATCH --job-name=MLR_walker_walk
#SBATCH --gres=gpu:h100
#SBATCH --time=50:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o walker_walk.out
#SBATCH -e walker_walk.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate tmv2
cd /scratch/user/s4642506/Mask-based-Latent-Reconstruction/src

export CUDA_VISIBLE_DEVICES=0
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=1 num_env_steps=105000 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=2 num_env_steps=105000 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=3 num_env_steps=105000 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=4 num_env_steps=105000 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=5 num_env_steps=105000 wandb=true agent=mtm_sac 
