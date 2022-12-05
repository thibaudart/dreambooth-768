accelerate launch train_dreambooth_768.py  \
--gradient_accumulation_steps=1 \
--pretrained_model_name_or_path="stabilityai/stable-diffusion-2"  \
--output_dir=../../train_768_arcane/model_out_10K_shivam_5e7_poly/ \
--with_prior_preservation  \
--prior_loss_weight=1.0 \
--resolution=768 \
--train_batch_size=1 \
--learning_rate=5e-7  \
--lr_scheduler="polynomial" \
--lr_warmup_steps=0 \
--num_class_images=1000 \
--max_train_steps=10000  \
--save_interval=99999 \
--concepts_list="../../train_768_arcane/concepts_list.json" \
--train_text_encoder \
--revision="fp16" \
--mixed_precision="fp16" \
--gradient_checkpointing 

accelerate launch train_dreambooth_768.py  \
--gradient_accumulation_steps=1 \
--pretrained_model_name_or_path="stabilityai/stable-diffusion-2"  \
--output_dir=../../train_768_arcane/model_out_10K_shivam_5e7_constant/ \
--with_prior_preservation  \
--prior_loss_weight=1.0 \
--resolution=768 \
--train_batch_size=1 \
--learning_rate=5e-7  \
--lr_scheduler="constant" \
--lr_warmup_steps=0 \
--num_class_images=1000 \
--max_train_steps=10000  \
--save_interval=99999 \
--concepts_list="../../train_768_arcane/concepts_list.json" \
--train_text_encoder \
--revision="fp16" \
--mixed_precision="fp16" \
--gradient_checkpointing 

