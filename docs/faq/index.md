# General FAQ

### System Requirements
Synesthesia requires at least macOS 10.13 or at least Windows 10 to function.

You will need a dedicated graphics card for best performance (the better your GPU is, the better Synesthesia will run). The Nvidia GTX 1060 is a good baseline. Synesthesia relies on OpenGL, so ensure your computer, OS, and GPU drivers support OpenGL 3.3 or later. Most computers built in the last 4 years should be fine.

---

### Where do I start?
> Check out the [quickstart video guide](../tutorials/quickstart_guide.md) for a more in-depth walkthrough

When you open Synesthesia, first make sure the audio input is working. Synesthesia is built to be run with a live audio stream at all times, so while you are testing performance or while you're using it live, you'll want to make sure it is receiving audio input. Check out the [audio faq](./audio.md) to learn more.

Next, if you have a dual monitor or projector setup, you'll want to create a fullscreen output.

1. Go to the Settings tab and locate the "toggle fullscreen" button.
2. If you're on OSX, drag the window to the display where you want it to appear, then maximize the window. If you're on Windows, select the display from the dropdown and click "toggle fullscreen".

Next you'll probably want to add media.

1. Go to the settings tab and scroll to where it says "Media Folders".
2. Click "add folder" and select a folder containing your media (.pngs, .jpgs, .mp4s, or .movs).
3. It will now appear in the "media" section of the GUI control panel.

Now you are ready to explore Synesthesia's built-in scenes. Click through the "Demo Scenes" playlist on the right-hand side or look through the scene library on the left-hand side. The scene controls are different for each scene. Explore various settings and save looks you like with the presets palette. Each scene uses media in a unique way, so try various combinations of scene + media until you find looks you like.

---

### How can I mix my own images or videos into a scene?
Most scenes in Synesthesia can interact with an image or video file. Generally, each scene will use the media in a different way. Sometimes there are special controls that modify how the scene will interact with your media, like a "media mix" slider. To add a folder of media that Synesthesia can use, follow the steps below:

1. Go to the Settings panel. 
2. Under "Media Folders", click on "Add Folder".
3. Locate the folder on your hard drive that has the images and/or videos you'd like to use in Synesthesia. You can add multiple folders.
4. Go back to the main control panel. Underneath the Meta Controls in the "Media" section, you should now see your files. Click on one to select it.
5. There are certain Meta Controls that modify the media, allowing you to change how the aspect ratio of the media is used, invert the media, change the media contrast, and for videos, change the playback speed and pause/play the videos.

---

### What file types does Synesthesia accept for media?
Synesthesia currently supports the following formats:

- .png
- .jpg
- .mov
- .mp4s

Note: Transparency (alpha channel) is treated as Black.

---
### Can I mix between two Scenes at once?
Currently, this is not possible in Synesthesia. It is a feature we're planning to add, but it will require some major new development to implement. For now, if you want to do smoother transitions we recommend fading to black, switching scenes, and then fading back up. Alternately, you can Spout Synesthesia into another VJ application that has more mixing options. Finally, some of our users have found a great workaround for this limitation by running two instances of Synesthesia at once. Both can be independently Syphon or Spouted from into any other third party VJ program that accepts Syphon or Spout input. Then you can run two different scenes at once and mix between them in the third party program. From user reports, this seems to be relatively stable, but note that this isn’t an officially supported solution, so you may encounter some odd behavior.

1. *Windows:* On Windows, simply launch one instance of Synesthesia and then navigate to Synesthesia again in the start menu and open another instance of it.
2. *macOS:* On macOS, you can’t simply launch Synesthesia twice like you can on Windows. You have to navigate to the application on your hard drive and then right click to “Show Package Contents”. Go to Contents -> MacOS -> Synesthesia (icon should be a black box). Double click on this to launch Synesthesia, and then double click again to launch a second instance.

---

### How do I create a custom scene folder?
A custom scene folder is required for saving any scenes outside of Synesthesia’s built-in content. It is simply a folder that will hold .synScene files that you have downloaded, or any you have converted using the Import Panel. To set a custom scene folder, simply create a folder on your Desktop (or any other location), named something like “My Scenes” or anything you’d like. Then in Synesthesia Settings, go to “Custom Scene Folder” and click “add folder”, and locate that new folder. Now any time you create a new scene in Synesthesia or import a scene from the Import Panel, it will appear here, and any scenes in this folder will be added to your Scene Library.

---

### How can I add more scenes?
You have multiple options:

1. Download scenes from our built-in Scene Marketplace ([learn more](https://production.synesthesia.live/marketplace))
2. Use the Shadertoy or ISF converters to convert existing shaders you find on the web to scenes capable of running in Synesthesia.[Here is a guide](https://medium.com/@theronpray/how-to-use-the-shadertoy-and-isf-converters-c529be1dc694)
3. Modify the built-in scenes or create your own scenes using the editing panel. [You can learn about the Synesthesia Shader Format here](../ssf/ssf.md), and check out our [GLSL resources](../resources/glsl_resources.md) page to learn more about coding in OpenGL Shader Language.

> **NOTE: please always respect the licenses granted to you by the creators of shaders you may find on the web. These are artistic works protected under copyright, and represent a huge amount of work on the part of the original creative coder.**

---

### How can I get .synScenes I downloaded to appear in Synesthesia?
You’ll need to use the .synScene importer in the import panel. Or, alternately, create a custom scene folder (in settings, at the bottom of the page), and then simply drag and drop the .synScene folders into your custom scene folder in Finder or Explorer. You can press the "refresh library" button in the Library tab to make the new scenes appear.

---

### How can I edit or customize Scenes in Synesthesia?
Under the hood, Scenes are really just fragment Shaders written in GLSL (OpenGL Shader Language), with some extra JSON to define controls and an optional JavaScript script. Coding fragment shaders can be tough at first, but can be very rewarding once you begin to understand how they work. The best introduction to coding fragment shaders is [the book of shaders](https://thebookofshaders.com/). You can find an excellent community of GLSL creatives over at [shadertoy](https://www.shadertoy.com/). Check out our [GLSL resources](../resources/glsl_resources.md) page for more learning resources.

Synesthesia scenes can be edited via the Edit Panel. You can open any scene directly from the edit panel by clicking the magnifying glass to locate a .synScene file or folder. Another way to open a scene for editing is from the Scene Library, clicking the pencil icon on any scene (this will automatically duplicate any built-in scene, as well). All edited or custom loaded scenes will live in your "Custom Scene Folder" which you can set manually in the Settings tab. You can only have one custom scene folder active at once, and without one active you won't be able to load custom scenes into your scene library.

Once you have loaded a scene into the edit panel, it will show in the visualizer. You are now in "live coding" mode with this scene. There are two ways to edit a scene: with an external code editor or with Synesthesia's built-in scene editor.

- **External editor**. Once a scene is loaded for editing, open the scene folder in your favorite text editor. After saving any of the scene files, press "ctrl/cmd r" or click the "reload scene" button to reload the scene. If there are any errors, you will see them in the Synesthesia console within the Edit tab in the right panel.
- **Built-in editor**. You can enable the built-in scene editor in the Settings tab in the "General" section. Once it is enabled, click the code icon in the left menu to get started. You can start editing any active scene by clicking the "edit scene" button. After making edits to `main.glsl`, `scene.json`, or `script.js`, press "ctrl/cmd r" or click the "reload scene" button to reload the scene. Press "ctrl/cmd s" or click the "save scene to file" button to save the scene to disk. If there are any errors, you will see them in the Synesthesia console within the Edit tab in the right panel.
