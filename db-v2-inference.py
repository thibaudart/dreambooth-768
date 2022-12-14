import torch

from torch import autocast
from diffusers import StableDiffusionPipeline, DDIMScheduler
import random

# Change these as you want:
model_path = "models_out/adam_768/100"
img_out_folder = "outputs/txt2img-images/"

# Image related config -- Change if you've used a different keyword:

# Try our original prompt and make sure it works okay:
# prompt = "closeup photo of ggd woman in the garden on a bright sunny day"
prompt = "photo of adza boy"
negative_prompt = ""
num_samples = 1
guidance_scale = 7.5
num_inference_steps = 20
height = 768
width = height

# Setup the scheduler and pipeline
scheduler = DDIMScheduler(beta_start=0.00085, beta_end=0.012, beta_schedule="scaled_linear", clip_sample=False, set_alpha_to_one=False)
pipe = StableDiffusionPipeline.from_pretrained(model_path, scheduler=scheduler, safety_checker=None, torch_dtype=torch.float16, revision="fp16").to("cuda")


# Generate the images:
images = pipe(
        prompt,
        height=height,
        width=width,
        negative_prompt=negative_prompt,
        num_images_per_prompt=num_samples,
        num_inference_steps=num_inference_steps,
        guidance_scale=guidance_scale,
    ).images

# Loop on the images and save them:
for img in images:
    i = random.randint(0, 200)
    img.save(f"{img_out_folder}/v2_{i}.png")
