# Gym Bit - Workout App ReadMe
For the app's demonstration we decided that we wanted the app to be in Dark mode by default as it looked good for the eye and more appealing. 
use an iphone 11 for the best uiView

![Pixel Art](https://media4.giphy.com/media/3oz8xOJiQ9VtnOKAIU/giphy.gif?cid=ecf05e47beuuq23qkseyb9r9qb2egz222ff8fh3xff6ldb42&rid=giphy.gif&ct=g)

## Changes
_Albaraa:_
1. Removed notification switch from the settings page since it was an extra feature and we cancelled it.
2. Added age slider in settings because I discovered that if the user skipped the quiz and saved the data from the settings
instead of the quiz he will never set his name (he can't). 

_Abdulaziz:_
* Generate Function
    1. Created a fully function and dynamic random exercises generator that the user can choose what type of exercise the user wants 

* Create Function
    1. Couldn't make the swipe to delete to look exactly like the mock as it was slightly different
    2. Made fully modular custom popups that come from one page and display different popups depending on what button is clicked 
    3. Added a confirm popup for clear schedule 
    4. Made the update name popup recognise if the name is empty or its been used and promts the user

_Yusuf:_     
In the Exercise Details Page, the Description and Tips label titles have been moved to stick closer to the top. The reason behind it is that it looks clearer for the user instead of it being so close to the actual text and squeezed in.

_Elias:_    
Have removed the "playsCounter" sort which should have sorted the schedules array based on the number of times they have been played because. Moreover, The "average total time" has also been removed because time was running out.

_Ali:_    
* Timer Feature
    1. Added a seperate screen to selet the warmup time as it would be less confusing for the users.
    2. Removed the skip button and replace it with a button on the screen to increase the consistency of the app.
    3. Added a header on the select time and timer screen to increase the consistency of the app.
    4. Added the timer indicator with animation using the code only without using any UIKit elements.
    5. Added a sound that is played when the timer count down is completed to alert the user once the warmup or rest time between sets finishes.
    6. Removed the hours column since it will not be used for warming up or rest time between sets.

* Play Workout Feature
    1. Removed some details from the landing screen such as number of sets and exercises as it was containing a lot of details which made it confusing for a lot of users.
    2. Added custom UIPresentationController to present rest time selection view for the half of the screen with blurry effect.
    3. Linked the exercise list on the landing screen with the exercise details screen to make it accessible for the users
