from diffusers import StableDiffusionPipeline, EulerAncestralDiscreteScheduler
import torch

model_id = "models/SD-2-1-512"

pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16).to(
    "cuda"
)
pipe.scheduler = EulerAncestralDiscreteScheduler.from_config(pipe.scheduler.config)

prompt = "portrait of adza boy"

torch.manual_seed(0)
image = pipe(prompt, num_inference_steps=20, guidance_scale=7).images[0]
image.save("./outputs/lora/adza_0.jpg")

from lora_diffusion import monkeypatch_lora, tune_lora_scale




models = ["lora_weight_e9_s1000"]

for model in models:
    monkeypatch_lora(pipe.unet, torch.load(f"./models_out/lora_768/{model}.pt"))

    for i in range(3):
        scale = 1 - i*0.1
        tune_lora_scale(pipe.unet, scale)

        torch.manual_seed(0)
        image = pipe(prompt, num_inference_steps=20, guidance_scale=7).images[0]
        image.save(f"./outputs/lora/adza_lora0_{model}_{scale}.jpg")


