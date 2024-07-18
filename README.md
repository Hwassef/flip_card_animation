# card_flip_animation

A Flutter project demonstrating a card flip animation with zoom effect.

## Description

This project showcases a card flip animation where a bank card flips between its front and back sides when tapped. Additionally, the card zooms in and out when a button is pressed, changing the background color during the zoom transition.
##  Live Preview
![Android Emulator - Pixel_3a_API_34_extension_level_7_x86_64_5554 2024-07-18 00-51-38](https://github.com/user-attachments/assets/9b2e142c-188f-4303-81a0-2cc96c44f29a)

## Features

- Flip animation between the front and back sides of the card.
- Zoom animation with background color change.
- Custom front and back card widgets.

## Getting Started

### Prerequisites

Ensure you have Flutter installed on your machine. You can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/card_flip_animation.git
Navigate to the project directory:
cd card_flip_animation
Install the dependencies:
flutter pub get
Running the App
Run the app on an emulator or a connected device:
flutter run
#   Code Overview
Main Widgets

CardWidget: The main widget that handles the card flip and zoom animations.

BankCardWidget: Custom widget for the front side of the bank card.

BankCardBackWidget: Custom widget for the back side of the bank card.

### Animation Controllers
_zoomController: Controls the zoom animation of the card.

_zoomAnimation: Animates the scale of the card.
### Methods
_switchCard: Toggles between the front and back sides of the card.

_buildFlipAnimation: Builds the flip animation using AnimatedSwitcher.

__transitionBuilder: Handles the transition animation between the front and back sides of the card.
