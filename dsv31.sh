# For more information on multi-node training launch methods, refer to:
# https://github.com/modelscope/ms-swift/tree/main/examples/train/multi-node

PYTORCH_CUDA_ALLOC_CONF='expandable_segments:True' \
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
NNODES=24 \
NODE_RANK=0 \
MASTER_ADDR=XXXX \
MASTER_PORT=XXXX \
NPROC_PER_NODE=8 \
megatron sft \
--train_type full \
--num_workers 8 \
--dataset_num_proc 8 \
--no_save_optim true \
--no_save_rng true \
--sequence_parallel true \
--weight-decay 0.01 \
--adam-beta1 0.9 \
--adam-beta2 0.95 \
--log_interval 2 \
--dataset {} \
--save {} \
--pipeline_model_parallel_size 12 \
--tensor_model_parallel_size 8 \
--expert_model_parallel_size 16 \
--expert_tensor_parallel_size 1 \
--context_parallel_size 1 \
--cross_entropy_loss_fusion true \
--sequence_parallel true \
--micro_batch_size 1 \
--global_batch_size 64 \
--streaming false \
--max_epochs 2 \
--split_dataset_ratio 0.05 \
--finetune true \
--lr 1e-05 \
--min_lr 1e-06 \
--lr_warmup_iters 0 \
--eval_interval 50 \
--save_interval 100 \
--max_length 32000 \
--tensorboard_dir {} \
--packing false \
--use_flash_attn true \
--recompute_granularity selective \
--recompute_modules core_attn moe_act \
--overlap_grad_reduce true \
--overlap_param_gather true \
--moe_grouped_gemm true \
--moe_aux_loss_coeff 1e-3 \
--moe_router_dtype fp32 \
--moe_permute_fusion true \
--attention_backend flash \
--loss_scale default \
--mtp_num_layers 1 \
--mtp_loss_scaling_factor 0.1 \
--bf16 true \
--model {} \
--load_safetensors true \
--save_safetensors true \
--decoder-first-pipeline-num-layers 6 \
--decoder-last-pipeline-num-layers 5



