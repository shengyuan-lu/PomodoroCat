# PomodoroCat
<img src="https://i.imgur.com/2r87O4V.png" width=750 />

## Demo Video
Click the image below to watch a demo video

[![Demo Video](https://img.youtube.com/vi/exW3XTd7Rys/0.jpg)](https://www.youtube.com/watch?v=exW3XTd7Rys)

## What is the Pomodoro Technique
“The Pomodoro Technique is a time management method developed by Francesco Cirillo in the late 1980s. The technique uses a timer to break down work into intervals, traditionally 25 minutes in length, separated by short breaks. Each interval is known as a pomodoro, from the Italian word for 'tomato'.” -- Wikipedia

<img src="https://i.imgur.com/HFV7yLY.png" width=750 />

## Inspiration
Working remotely can be challenging, especially amidst a worldwide pandemic that knocks everyone off balance. Identifying a way to avoid an overwhelming schedule while coping with pressure from either work or school is crucial to our mental health as well as physical health. While the world’s entertainment industry booms in the past year, we realize that people are actively seeking ways to unwind meanwhile leveraging various relaxation outlets to cater to their intricate relationship with life. After analyzing the current applications that target productivity, we decide to integrate a fun game that allows users to keep their own cats while keeping track of their time using the famous Pomodoro technique. Pomodoro Technique is a time management mechanism developed by Francesco Cirillo in the late 1980s. The technique uses a timer to break down a large chunk of work into intervals, conventionally 25 minutes in length, separated by short breaks. Each interval is known as a pomodoro, inspired by the Italian word for “Tomato.”

<img src="https://i.imgur.com/eTz5LiD.png" width=750 />

<img src="https://i.imgur.com/bYX9hsO.png" width=750 />

<img src="https://i.imgur.com/jvsD4lH.png" width=750 />

<img src="https://i.imgur.com/TtOa0Xl.png" width=750 />

## What it does
Based on the Pomodoro Technique, our application offers a customizable way for users to set their own working sessions. Users can choose the duration of their short work sessions to optimize labor division of their intended tasks. Users are also given the option to customize the duration of their short and long breaks as well as the number of working cycles before commencing a long break. The number of cat coins is calculated based on the accumulated amount of time that the users spend on their work. In a separate view where users keep track of their cats, cat coins are used as currency to customize the background and decorations for the cat. Moreover, we support cat coin booster features that allow the users to earn extra cat coins within a limited time frame compared to normal users. By earning cat coins during work sessions in the application, users are given the option to purchase decorations for their cats, which serves as a positive reinforcement that helps release the pressure of completing arduous tasks. As users purchase decorations for their cats, the happiness index for the cat would increase. The highest threshold of the happiness index is at 100. 

<img src="https://i.imgur.com/Q0LFwdU.png" width=750 />

<img src="https://i.imgur.com/2R6cm9h.png" width=750 />

## Functions
- [x] Set timer with user-defined durations
- [x] Interchange between the timer and the cat's habitat
- [x] Tap on the shop buttton, purchase items, and speeding up the timer
- [x] Shop for the cat to add items to the habitat

## How we built it
Our front end developers used SwiftUI 2, Combine and AVFoundation to build the timer feature for PomodoroCat. The UI is constructed so that two TabViews are subviews of one single NavigationView. This allows the app to switch between the working timer screen and the cat game screen easily and to avoid redundant codes in a duplicated NavigationView. A single set of data is shared and synced across the app thanks to SwiftUI 2’s newest @AppStorage property wrapper. The front end engineers fully take advantage of SwiftUI’s MVVM (Model - View - ViewModel) design by writing view models for each subview. This technique would enable the app to scale up in the future. Our backend develops used parse servers to enable user login feature to associate the specific user with the amount of cat coins and the past purchases. The graphic assets of our application are designed from scratch by our team members. No stock photos are involved. The user interface integrates our graphic assets combined with sound effects to simulate the cat’s living environment. 

For our business model, we implemented the booster features in order to generate potential revenues that come from future users of our application. The booster feature allows users to speed up their rate of collecting cat coins, which in turn satisfies their demand of unlocking more decorations for their cats.

<img src="https://i.imgur.com/pDpAkaj.png" width=750 />

## Challenges we ran into
We plan to implement the login feature for individual users in order to keep track of their account settings including the status of their cats and the amount of cat coins. Due to the time constraint, we found it challenging to implement the authentication process through Firebase. We switched our user login method to the conventional username + password and stored the data on Back4App for now due to the limited time.

## Accomplishments that we're proud of
We are proud of introducing our own graphics design as parts of our user interface. We were able to come up with original designs that we think will draw future users’ attention. We are also proud of the clean user interface enhanced by positive reinforcement cycles that motivates our users to keep on track of their tasks in our application. Our user interface pays particular attention to the color themes and makes sure that it is visually appealing.

## What we learned
We learnt about the implementation of SwiftUI framework as well as backend support using parse servers. We also explored Firebase and learnt about the potential of how it would enable a smoother communication between our application and the users. 
