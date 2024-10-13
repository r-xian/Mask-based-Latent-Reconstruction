#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30G
#SBATCH --job-name=MLR_RE_FS_WW
#SBATCH --gres=gpu
#SBATCH --time=70:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o RE_FS_WW.out
#SBATCH -e RE_FS_WW.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate tmv2
cd /scratch/user/s4642506/Mask-based-Latent-Reconstruction/src

export CUDA_VISIBLE_DEVICES=0
#reacher_easy 1,2,3
srun   
srun python ./train.py --config-path ./configs --config-name reacher_easy jumps=15 seed=2 num_env_steps=105000 wandb=true agent=mtm_sac #4 hours
srun python ./train.py --config-path ./configs --config-name reacher_easy jumps=15 seed=3 num_env_steps=105000 wandb=true agent=mtm_sac 
#finger spin 2, 3
srun python ./train.py --config-path ./configs --config-name finger_spin jumps=15 seed=2 num_env_steps=105000 wandb=true agent=mtm_sac #8 hours
srun python ./train.py --config-path ./configs --config-name finger_spin jumps=15 seed=3 num_env_steps=105000 wandb=true agent=mtm_sac 
# walker_walk 1,2,3
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=1 num_env_steps=105000 wandb=true agent=mtm_sac # 8 hours
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=2 num_env_steps=105000 wandb=true agent=mtm_sac 
srun python ./train.py --config-path ./configs --config-name walker_walk jumps=15 seed=3 num_env_steps=105000 wandb=true agent=mtm_sac 