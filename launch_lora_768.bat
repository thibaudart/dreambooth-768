@echo off
cls

set /p "id=Have you activate the venv (cmd : .\venv_diffusers_sd_2\Scripts\Activate.ps1 ) [y/n*]: "


echo %id%
if /i  "%id%"=="y" (
    echo LORA 768 - Adam

call accelerate launch --num_cpu_threads_per_process 6 code\resources\lora\train_lora_dreambooth.py ^
--pretrained_model_name_or_path="models\SD-2-1-768" ^
--instance_data_dir="data/instance_images/adam_768/subject_images" ^
--instance_prompt="adza boy" ^
--class_prompt="a boy" ^
--class_data_dir="data/reg_images/boy_768" ^
--with_prior_preservation ^
--output_dir="models_out/lora_768/" ^
--max_train_steps=1000 ^
--save_steps=200 ^
--learning_rate=1e-4 ^
--lr_scheduler="constant" ^
--gradient_checkpointing ^
--mixed_precision="fp16" ^
--gradient_checkpointing ^
--gradient_accumulation_steps=1 ^
--use_8bit_adam  ^
--resolution=768 ^
--train_batch_size=4 
 

) else (echo ok launch it now!)


