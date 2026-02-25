## Installation

From the root of the `alignment-handbook` directory, run:

```shell
bash recipes/post-training-recipe/install.sh
```

## Full training examples

> All commands below must be run from the root of the `alignment-handbook` directory.

```shell
# Step 1 - Mid-Training
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/zero3.yaml scripts/sft.py --config recipes/post-training-recipe/sft/mid.yaml --gradient_accumulation_steps 16

# Step 2 - SFT
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/zero3.yaml scripts/sft.py --config recipes/post-training-recipe/sft/sft.yaml --gradient_accumulation_steps 16

# Step 2 - DPO
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/zero3.yaml scripts/dpo.py --config recipes/post-training-recipe/dpo/apo.yaml --gradient_accumulation_steps 4
```