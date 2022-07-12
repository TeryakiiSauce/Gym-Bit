# Gym Bit iOS Workout App 📱

> 📌 Note: Repo is now archived because we will not make any further changes (development stopped); however, you can still clone, fork, etc. Team members please contact me if you want to continue development.

<p align='center'><img style="width: 50%" src="https://media4.giphy.com/media/3oz8xOJiQ9VtnOKAIU/giphy.gif?cid=ecf05e47beuuq23qkseyb9r9qb2egz222ff8fh3xff6ldb42&rid=giphy.gif&ct=g"></p>

## Changes Decided 👨🏻‍💻
### _Main:_
* For the app's demonstration, we have decided that we wanted the app to be displayed as **Dark** mode by default as it looked better for the eye and more appealing. Please use an *iPhone 11* for the best UI View.

### _Abdulaziz:_
* *'Generate'* Function
    1. **Created** a fully functionable and dynamic random exercises generator that generates various exercises and later allows the user to modify the generated exercises.

* *'Create'* Function
    1. **Added** a *Confirmation Popup* before removing a schedule.
    2. **Created** a fully modular *'Custom Popups'* that come from one page and display different popups depending on what button is clicked.
    3. Was not able to make the swipe to delete to look exactly like the mock as it was slightly difficult.
    4. The update name popup is now able to *recognise* if the user's name is empty or not and then promts the user appropriately.

### _Albaraa:_
1. **Added** age slider in settings because it was discovered that if the user skipped the quiz and saved the data from the settings instead of the quiz they will not be able to set their name later.
2. **Removed** notification switch from the settings page since it was an extra feature and we cancelled it.

### _Ali:_    
* *'Timer'* Feature
    1. **Added** a header on the select time and timer screen to increase the consistency of the app.
    2. **Added** a seperate screen to select the warmup time as it would be less confusing for the users.
    3. **Added** a sound that is played when the timer count down is completed to alert the user once the warmup or rest time between sets finishes.
    4. **Added** the timer indicator with animation using the code only without using any UIKit elements.
    5. **Removed** the hours column since it will not be used for warming up or rest time between sets.
    6. **Removed** the skip button and replaced it with a button on the screen to increase the consistency of the app.

* *'Play Workout'* Feature
    1. **Added** custom UIPresentationController to present rest time selection view for the half of the screen with blurry effect.
    2. **Linked** the exercise list on the landing screen with the exercise details screen to make it accessible for the users.
    3. **Removed** some details from the landing screen such as number of sets and exercises as it was containing a lot of details which made it confusing for a lot of users.

### _Elias:_    
1. **Removed** the *'Plays Counter'* sort which should have sorted the schedules array based on the number of times they have been played. Moreover, The *'Average Total Time'* has also been removed because the deadline was close.

### _Yusuf:_
1. In the *'Exercise Details Page'*, the Description and Tips label titles have been moved to stick closer to the top. The reason behind it is that it looks clearer for the user instead of it being so close to the actual text and squeezed in.
