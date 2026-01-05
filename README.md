# LM Stick

LM Stick is a compact self-contained LLM Model, LLM runner, and GUI for interacting with that model

[Download Link](https://pub-bfb26aaa51024d16b54830768efdd3af.r2.dev/LM_Stick.zip)

Copy LM Stick onto a USB and you are walking with an LLM in your pocket that you can plug into any Windows 11 PC (>= 8 GB RAM) and use without any dependencies and without any installation required

Copy LM Stick onto your Windows 11 PC and you run from your own drive completely locally

It is meant to serve as a portable self-contained LLM Model and runner with minimal to no dependencies:

* Can run completely locally
* No installation required
* Single exe runner for simplicity
 

## How it works and the story of how it came to be

I tend to have an affinity towards freedom, freedom of knowledge, freedom of speech and in general of freedom.

At the moment the only way to access an LLM model is to buy a subscription for a closed model and use it via the internet, or be finicky enough to download an open source model and find or develop your runner and GUI for that model.

Ollama provides an easy access to downloading open source models, runners for loading those models into memory, creating a server for any interface, and providing a GUI interface as well.

I had come across Ollama some time ago, however it did not excite me as such because I could pay for a much better experience. It was while watching [Cody Wabiszewski's Tutorial](https://www.youtube.com/watch?v=eiMSapoeyaU) on running a local LLM on my PC and it being portable, compact, completely local and still powerful that I saw the benefits of Ollama.

I followed the tutorial and was inspired enough to simplify the whole process with a couple of powershell scripts and upload the compact "LM Stick" onto a cloudflare bucket from where anyone can [download](https://pub-bfb26aaa51024d16b54830768efdd3af.r2.dev/LM_Stick.zip) it.

Further interacting with the dolphin-llama model I realised that even 7B parameters have immense value and knowledge that it is viable and justifiable to use such models even in everyday life. Imagine you are stuck on an island with a solar panel and a windows PC and this "LM Stick" and I am sure you'd be glad to have the "knowledge of the entirety of human history" at the leisure of a "well-asked question".

I should also add that I found other products similar to "LM Stick" namely [Run Zhou's Local\_LLM\_Notepad](https://github.com/runzhouye/Local_LLM_Notepad) and [Binh Pham's llama.zero](https://www.youtube.com/watch?v=SM-fFsE9EDU) which I found on [Nick Bild's](https://www.hackster.io/news/an-llm-on-a-stick-470840d7e4be) article on [Hackster.io](https://www.hackster.io/).

They were very well put together, and I am very thankful there are so many others working so hard in this space; however, I still felt that "LM Stick" provided value perhaps by being a simpler user experience (since it is using ollama GUI which is quite elegant, and the ollama HTTP server quite robust and performant). Hence I worked on "LM Stick" and am hoping that it provides some value to someone.

###  As to how It Works:
- **`.ollama/`** — contains the `dolphin-llama3` model files (and local Ollama data)
- **`ollama-bin/`** — contains `ollama.exe` (Server) and `ollama app.exe` (GUI)
- **`ollama.exe serve`** — starts a local HTTP server, loads the model into memory, and exposes an API on your machine
- **`ollama app.exe`** — the GUI that talks to the local Ollama server
- **`run.exe`** — LM Stick’s launcher: sets required environment variables, starts `ollama.exe` + `ollama app.exe`, and provides predictable shutdown
- Download and unzip: [LM_Stick.zip](https://pub-bfb26aaa51024d16b54830768efdd3af.r2.dev/LM_Stick.zip)

**Note:** Keep all LM Stick files together (don’t move `.ollama/` or `ollama-bin/`). `run.exe` will fail otherwise.  
You *can* create a shortcut to `run.exe` and place the shortcut anywhere.

### Folder Structure

LM Stick <br>
|---- .ollama (has models + history) <br>
|---- ollama-bin (has ollama server + app)<br>
|---- runners (runners source code) <br>
|---- run.exe

## Credits

* Built with Meta Llama 3
* Inspired by: Cody Wabiszewski [Youtube](https://www.youtube.com/watch?v=eiMSapoeyaU) [Website](https://www.gsnetwork.com/how-to-use-the-dolphin-llama-3-ollama-model/)
* Ollama Team [Website](https://ollama.com/library/dolphin-llama3)
* Dolphin-Llama3 Team [Website](https://huggingface.co/dphn/dolphin-2.9-llama3-8b)
