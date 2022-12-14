@echo off
cls

echo Training 512 - Adam

call accelerate launch code\resources\shivam\examples\dreambooth\train_dreambooth.py ^
 --gradient_accumulation_steps=1 ^
 --pretrained_model_name_or_path="models\SD-2-1-512" ^
 --pretrained_vae_name_or_path "stabilityai/sd-vae-ft-mse" ^
 --output_dir=models_out/adam_512/ ^
 --with_prior_preservation ^
 --prior_loss_weight=1.0 ^
 --resolution=512 ^
 --train_batch_size=4 ^
 --learning_rate=2e-6 ^
 --lr_scheduler="constant" ^
 --lr_warmup_steps=0 ^
 --num_class_images=200 ^
 --max_train_steps=500 ^
 --concepts_list="data/instance_images/adam_512/concepts_list.json" ^
 --train_text_encoder ^
 --revision="fp16" ^
 --mixed_precision="fp16" ^
 --gradient_checkpointing ^
 --use_8bit_adam 

