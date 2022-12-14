@echo off
cls

echo Training 768 - Adam

set /p "id=Have you activate the venv (cmd : .\venv_diffusers_sd_2\Scripts\Activate.ps1 ) [y/n*]: "


echo %id%
if /i  "%id%"=="y" (
 
call accelerate launch code\resources\shivam\examples\dreambooth\train_dreambooth_768.py ^
 --gradient_accumulation_steps=1 ^
 --pretrained_model_name_or_path="models\SD-2-1-768" ^
 --output_dir=models_out/adam_768_2e6_batch_textencoder50/ ^
 --with_prior_preservation ^
 --prior_loss_weight=1.0 ^
 --resolution=768 ^
 --train_batch_size=2 ^
 --learning_rate=2e-6 ^
 --lr_scheduler="constant" ^
 --lr_warmup_steps=0 ^
 --num_class_images=200 ^
 --max_train_steps=2000 ^
 --concepts_list="data/instance_images/adam_768/concepts_list.json" ^
 --train_text_encoder ^
 --max_train_text_encoder=0.5 ^
 --revision="fp16" ^
 --mixed_precision="fp16" ^
 --gradient_checkpointing ^
 --save_interval=200 ^
 --save_min_steps=1600 ^
 --use_8bit_adam 

 call accelerate launch code\resources\shivam\examples\dreambooth\train_dreambooth_768.py ^
 --gradient_accumulation_steps=1 ^
 --pretrained_model_name_or_path="models\SD-2-1-768" ^
 --output_dir=models_out/adam_768_2e6_batch_textencoder50polynomial/ ^
 --with_prior_preservation ^
 --prior_loss_weight=1.0 ^
 --resolution=768 ^
 --train_batch_size=2 ^
 --learning_rate=2e-6 ^
 --lr_scheduler="polynomial" ^
 --lr_warmup_steps=0 ^
 --num_class_images=200 ^
 --max_train_steps=2000 ^
 --concepts_list="data/instance_images/adam_768/concepts_list.json" ^
 --train_text_encoder ^
 --max_train_text_encoder=0.5 ^
 --revision="fp16" ^
 --mixed_precision="fp16" ^
 --gradient_checkpointing ^
 --save_interval=200 ^
 --save_min_steps=1600 ^
 --use_8bit_adam 

) else (
    echo ok launch it now!
)