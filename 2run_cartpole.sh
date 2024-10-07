#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30G
#SBATCH --job-name=MLR_cartpole_swingup
#SBATCH --gres=gpu:h100
#SBATCH --time=50:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o cartpole_swingup.out
#SBATCH -e cartpole_swingup.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate tmv2
cd /scratch/user/s4642506/Mask-based-Latent-Reconstruction/src

export CUDA_VISIBLE_DEVICES=0
srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=1 num_env_steps=105000 work_dir=output/cartpole_swingup_1 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=2 num_env_steps=105000 work_dir=output/cartpole_swingup_2 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=3 num_env_steps=105000 work_dir=output/cartpole_swingup_3 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=4 num_env_steps=105000 work_dir=output/cartpole_swingup_4 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name cartpole_swingup jumps=15 seed=5 num_env_steps=105000 work_dir=output/cartpole_swingup_5 wandb=true agent=mtm_sac 
