# Audio Settings

### How do I set up my Audio Input?
- To select an audio device, go to the Settings panel and select from the drop down menu next to "Audio Device".
- To refresh this list and scan for newly attached devices, click the refresh button right next to the drop down.

Once you've selected a device, look over to the audio indicator under the preview window on the right-hand side. It should have a green line showing the incoming audio level. Otherwise, if you see the whole indicator glowing red, that means no signal is detected. Try restarting your audio devices, adjusting the incoming microphone level in your computer's system settings, or try a different audio input device.

Important note: Synesthesia requires an audio input device. Simply playing music through your speakers or aux port is using an audio output device and will not automatically route into Synesthesia. To capture audio from your computer, you'll need to use software like Sound Siphon (macOS) or Stereo Mix (Windows). For more on this, see ["What is the best way to get audio into Synesthesia?"](#what-is-the-best-way-to-get-audio-into-synesthesia)

---

### What is the best way to get audio into Synesthesia?

Synesthesia is built to be run with a live audio stream, so while you are testing performance or while you're using it live, you'll want to make sure it is receiving an audio stream of some kind.

In general, you don't have to worry about setting the audio levels very carefully for Synesthesia to work. We try to make the audio reactivity as reliable and consistent as possible, across all microphone qualities and volumes. However, if the signal is too quiet (coming in at less than 1%) or too loud (stuck at 100% and clipping), the audio engine won't behave as it should. Some clipping or periodic silence is fine.

Here are a few different options for audio input:

**Built-in Microphone**

For a live show, the easiest and most reliable option is to just use your laptop's built-in microphone. Synesthesia's audio engine will work just fine with this sort of "lower quality" audio input. You'll need to make sure the volume of the music in the venue is loud enough that it is the primary thing the computer is hearing (IE, not hearing only your conversation or crowd noises).

If the audio indicator is yellow, it means the audio input is too loud and clipping. In this case, you should lower your computer's microphone input volume in the microphone settings. 

- On macOS this is in your System Preferences -> Sound -> Input.
- On Windows this is at Settings -> Sound -> Input -> Device properties -> Volume

While performing live, you'll always get a bit of crowd-reactive visuals this way, but you can get around this with a fade out at the end of songs, or just embrace it.

While at home, you can also use the built-in microphone. Just make sure the music you're playing is loud enough that your microphone is getting a decent signal.

**Audio Interface**

This is the best way to get a "clean" audio signal to Synesthesia. Connect your audio interface, make sure any drivers and/or support softwares that the hardware requires are installed, and then run Synesthesia. Many audio interfaces have multiple channels or inputs available. Currently, Synesthesia doesn't have advanced input selection options. It will default to the first input and combine all channels available on that input into one mix.

At a live show, you could ask the sound person for a mixed audio signal to send over an XLR or quarter-inch cord input to your Audio Interface, and then the audio signal will be available on your computer via the USB connection. However, there are a number of issues with this approach:

- Your audio signal is now dependent on someone else's hardware. If they change something, you may lose audio during the show and have to switch back to a mic
- The setup will be different everywhere you go, or even change over the course of the night, depending on the sound hardware, the bands playing, etc.

**Sound Siphon (macOS) / Stereo Mix (Windows)**

Use this if you want to capture the audio off of the same computer that is running Synesthesia. See ["How can I play music from iTunes or Spotify into Synesthesia?"](#how-can-i-play-music-from-itunes-or-spotify-into-synesthesia)

---

### How can I play music from iTunes or Spotify into Synesthesia?

Sound Siphon (macOS) / Stereo Mix (Windows)

Synesthesia requires an audio input device in order to get a live audio feed to analyze. On both macOS and Windows, the audio coming out of the computer is classified as audio output, and is not accessible to Synesthesia. However, there are great workarounds for both platforms.

**macOS**

The best supported solution for Mac is called Sound Siphon, available here: https://staticz.com/soundsiphon/. It has a free trial, but if you are a VJ working with audio signals on a Mac, you'll probably have use for this again and again and should consider purchasing. Check out this [guide](https://www.synesthesia.live/resources/sound-siphon-help.pdf) to setting up Sound Siphon with Synesthesia.

An alternative application is [Soundflower](https://rogueamoeba.com/freebies/soundflower/), which is free and open-source.

**Windows**

Windows has a built-in output as input option. All you have to do is enable and audio device called "Stereo Mix".

1. Right click on the audio icon in your system tray (bottom right), and select "Recording Devices".
2. Right click on a blank area in the box and make sure both "Show Disabled Devices" and "Show Disconnected Devices" options are checked. This should make a device called "Stereo Mix" appear.
3. Right click on "Stereo Mix" and click "Enable" to turn it on.
4. Click on the refresh icon next to the audio devices drop down menu in Synesthesia, and select "Stereo Mix" from the sources. If you still don't see it, try restarting Synesthesia.
5. Any music you output through your main audio output should now also be picked up by Synesthesia.

### "Stereo Mix doesn't work for me" (VoiceMeeter setup guide):
With certain audio outputs, Stereo Mix won't be available or won't work. One option we recommend in this scenario is VoiceMeeter, a set of donationware programs from VB-Audio.

One advantage of using Voicemeeter instead of Stereo Mix is that the volume of the virtual input is independent of your hardware output volume. You can maintain full volume for Synesthesia's audio input signal while your speaker output is low or muted.

1. Download and install [VoiceMeeter](https://vb-audio.com/Voicemeeter/index.htm) from VB-Audio, following their installation instructions. You can also use Banana or Potato from VB-Audio, but for this guide we'll be using VoiceMeeter.
2. Follow VB-Audio's guide to [set VoiceMeeter as your default output device](https://voicemeeter.com/user-guide-startup-the-first-steps-replace-the-windows-mixer-with-voicemeeter/)
3. Open Synesthesia and go to the Settings tab, set your Audio Device to 'VoiceMeeter Output'.
4. Play some music and open an audio reactive scene to test. Check out the [VoiceMeeter User Manual](https://vb-audio.com/Voicemeeter/Voicemeeter_UserManual.pdf) to learn more.