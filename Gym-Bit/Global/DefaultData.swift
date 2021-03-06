//
//  DefaultData.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 01/01/2022.
//

import Foundation

struct DefaultData {
    
    //default instance of exercises
    static var backExercises =
        [

            Exercise(name: "Pull-ups", description: "Pull-ups are a functional bodyweight exercise that are great for building holistic upper-body strength.", imagePath: "back1", tips: ["You could wear extra weights if you are trying to make it more challenging.","If the exercise is too hard, put a chair below your feet to push yourself up a bit."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Reverse Pull Down", description: "The reverse grip lat pull down is a variation of the lat pull down and an exercise used to build the muscles of the back. While the exercise will primarily target the lats, you will also notice a fair amount of bicep and middle back activation.", imagePath: "back2", tips: ["Keep some tone through your abdominals as you pull the bar into your body to ensure you don’t arch excessively through the spine.","Don’t allow momentum to dictate the movement"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Reversed Flys", description: "The seated bent over dumbbell reverse fly is a dumbbell reverse fly variation and an exercise used to strength then rear deltoids. The rear deltoids are a smaller muscle group of the shoulder and upper back.", imagePath: "back3", tips: ["Keep the abs braced and don’t arch the back at the top of the movement.","Don’t jut your head forward during the movement - this is about stimulation for a small muscle group."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Cable Rows", description: "The seated cable row develops the muscles of the back and the forearms. It is an excellent all-around compound exercise for developing the middle back while offering useful arm work as well.", imagePath: "back4", tips: ["Don't crash the weights and don't pause or bounce at the bottom of the lift.","Your back should be straight at all times, not bent. You can flex slightly at the hip to allow a full range of motion."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Cable Pull Down", description: "The lat pulldown primarily trains our latissimus dorsi, the most significant muscle in the upper body. The lats are a large and wide muscle that originates from the scapula’s lower back and bottom portion.", imagePath: "back5", tips: ["You could wear extra weights if you are trying to make it more challenging.","If the exercise is too hard, put a chair below your feet to push yourself up a bit."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Incline Reverse Flys", description: "The incline dumbbell reverse fly is an upper-body exercise targeting the posterior or rear deltoids, as well as the postural muscles of the upper back.", imagePath: "back6", tips: ["Try to squeeze your shoulder blades together to get the best results from this exercise.","Feel the contraction and slowly lower the weights back down to the starting position while inhaling."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            
            Exercise(name: "Reverse Lat Pull Down", description: "The reverse grip lat pull down is a variation of the lat pull down and an exercise used to build the muscles of the back. While the exercise will primarily target the lats, you will also notice a fair amount of bicep and middle back activation.", imagePath: "back7", tips: ["Keep some tone through your abdominals as you pull the bar into your body to ensure you don’t arch excessively through the spine.","Don’t allow momentum to dictate the movement."], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            

        ]
    
    static var chestExercises =
        [

            Exercise(name: "Seated Chest Press", description: "The chest press helps build the pectoral muscles while also working the biceps, deltoids, and latissimus dorsi. The seated chest press is an upright version of the lying bench press and a great addition to an upper-body strength workout.", imagePath: "chest1", tips: ["Don't stress your shoulder joint by extending your elbows too far back when grasping the handles. A little extension is okay, but the handgrips should always be in front of your body line.","Keep your back and shoulder blades against the back support."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Flat Bench Press", description: "The barbell bench press is a classic exercise popular among all weight lifting circles. From bodybuilders to powerlifters, the bench press is a staple chest exercise in nearly every workout program.", imagePath: "chest2", tips: ["Keep the bar in line with your wrist and elbows and ensure it travels in a straight line.","If you want to keep more tension through the triceps and chest, stop each repetition just short of lockout at the top."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Cable Chest Fly", description: "The standing cable fly is a variation of the chest fly and an exercise used to strengthen the pushing muscles of the body including the chest, triceps, and shoulders.", imagePath: "chest3", tips: ["Imagine you’re trying to hug a tree while completing the exercise.","Don’t squeeze the handles excessively tight as this can over recruit the forearms and biceps thereby reducing activation of the pecs."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Inclined Press", description: "The incline dumbbell press is designed to increase chest strength and size, so it's typically included in a well-rounded, intermediate strength training program.", imagePath: "chest4", tips: ["Select an appropriate weight for your strength level, which is probably less than you think.","If you have ongoing shoulder pain, attempt the exercise on a machine before trying it with dumbbells."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Reverse Crossover", description: "This exercise mainly contracts the posterior deltoid, infraspinatus, teres minor, and, at the end of the movement as the shoulder blades come together, the trapezius and deeper in, the rhomboids.", imagePath: "chest5", tips: ["Try to keep your torso upright, not leaning too far forward or back.","Avoid bending your elbows, shrugging your shoulders, and changing the plane of your arm movement."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Seated Machine Fly", description: "The chest fly or pec deck is a great way for both beginners and those with experience to target the chest muscles without worrying about the balance required when using a bench, a ball, or when standing.", imagePath: "chest6", tips: ["Lift and lower the weight using slow, controlled movements.","Exhale as your arms bring the handles together in front of your chest and inhale as you return the handles back to the open position."], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            
            Exercise(name: "Flat Reverse Press", description: "This position places emphasis on building strength and size in the triceps muscles, as well as the chest.", imagePath: "chest7", tips: ["Maintain proper body position on the bench for safe and effective execution of the movement.","Lifting hips off the bench during a press may be an indicator the weight is too heavy."], targetMuscle: Exercise.TargetMuscle.chest.rawValue)
            

        ]
    
    static var shoulderExercises =
        [

            Exercise(name: "Shoulder Press", description: "machine shoulder press is a exercise machine exercise that primarily targets the shoulders and to a lesser degree also targets the chest, middle back and triceps.", imagePath: "shoulder1", tips: ["Use weights that allow you to complete full reps before progressing.","Give your body time to grow bigger and stronger, and don’t rush the process by compromising your technique."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Dumbbell Front Raise", description: "The dumbbell front raise is a fundamental weight training exercise that is great for people who want to build strength or create more definition in the shoulders.", imagePath: "shoulder2", tips: ["Your wrists should be in a neutral position, not bent up or down. If you find you can't maintain a neutral position, the weights are too heavy.","Keep the back straight and brace the abdominals."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Dumbbell Side Raise", description: "The side raise is an effective shoulder-strengthening movement designed to isolate the lateral head of the deltoid muscle. ", imagePath: "shoulder3", tips: ["Avoid swining the dumbbell upwards. Instead lift them slowly.","It's important to maintain good posture with a neutral neck and spine alignment throughout the exercise."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Seated Shoulder Raise", description: "The seated barbell shoulder press is a variation of the overhead press and an exercise used to build shoulder strength and muscle.", imagePath: "shoulder4", tips: ["Reach tall at the top and don’t worry about keeping the shoulders packed down and back.","Allow the elbows to rotate and point outward at the top of the movement."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Barbell Upright Row", description: "Barbell upright rows mainly target your deltoids and your traps.", imagePath: "shoulder5", tips: ["Focus on keeping your elbows higher than your forearms. The elbows push the motion.","Keep your body fixed throughout the set. Don't lean forward as you lower the bar, and back as you raise it."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Seated Dumbbell Press", description: "The seated dumbbell press is a variation of the standing dumbbell press and an exercise used to strengthen the muscles of the shoulders.", imagePath: "shoulder6", tips: ["Keeping the elbows slightly bent at the top and not locking out entirely will help to keep tension on the shoulders.","If you can’t lock out the elbows overhead than it is due to poor scapular upward rotation."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
            Exercise(name: "Barbell Shrugs", description: "The barbell shrug is a great exercise for those looking to build their trap muscles. Heavy shrugs are a favorite among many professionals who use the exercise to build bigger traps.", imagePath: "shoulder7", tips: ["Looking slightly up while shrugging may enhance the contraction as traps help to control movement of the skull.","Limit momentum and excessive jerking or bouncing of the weight. No one cares about how much you shrug."], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue)
    

        ]
    
    static var legExercises =
        [

            Exercise(name: "Lying Leg Curl", description: "The leg curl is an isolation exercise that targets the back of the leg (the hamstrings and calf muscles). It can be performed in a variety of positions and makes a good addition to most any lower body strength training workout.", imagePath: "legs1", tips: ["Select a weight that allows you to do 8 to 12 repetitions with reasonable effort.","If the padded lever is too high on your calves, this can place pressure on your Achilles and reduce your range of motion."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Sumo Deadlift", description: "The sumo deadlift has the lifter widen their stance and lift a barbell with their hands inside of their thighs.", imagePath: "legs2", tips: ["Visualize pressure rising in the body before every pull, with all the muscles being engaged and ready to fire at once.","Keep your chest up and, as you pull, make sure the bar is against your shins to avoid letting the path of the bar shift too far forward."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Leg Abductor Machine", description: "Machine thigh abductor is a exercise machine exercise that primarily targets the outer thighs.", imagePath: "legs3", tips: ["Hold on to the side grab handles during the execution, fix your upper body and look straight ahead","Make sure that your thighs are parallel to the floor."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Seated Calf Raise", description: "The seated calf raise is a variation of the machine calf raise and an exercise used to isolate the muscles of the calves.", imagePath: "legs4", tips: ["Keep the repetitions slow and controlled. Limit momentum and pause at the top to emphasize the contraction.","Limit depth of the heels if you feel any sort of stretch through the bottom of the foot during the exercise."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Smith Machine Squat", description: "The Smith machine squat is a variation of the squat and an exercise used to build the muscles of the legs. In particular, the Smith machine squat will place a lot of emphasis on the quads.", imagePath: "legs5", tips: ["Low bar will not work well with smith machine squats due to the completely vertical bar path.","Drive through the whole foot - you want 3 points of contact: big toe, little toe, and heel."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Goblet Squat", description: "The goblet squat is a popular lower-body exercise where you hold a kettlebell or dumbbell in front of your chest as if you are supporting a heavy cup or goblet.", imagePath: "legs6", tips: ["Wrap a lightweight mini-band around your shins just below your knees.","Consciously tighten your core and keep the dumbbell in contact with your stomach throughout the rep."], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
            Exercise(name: "Hack Squat", description: "A hack squat works the entire lower body — including the glutes, hamstrings, quads, and calves — as well as the core.", imagePath: "legs7", tips: ["You’ll want to ensure that your feet are shoulder-width apart and not too high on the foot plate","The key with a hack squat is to get your knees to a 90-degree angle."], targetMuscle: Exercise.TargetMuscle.legs.rawValue)


            
        ]
    
    static var absExercises =
        [

            Exercise(name: "Jack Knives", description: "Jack knife sit ups are a great low-impact exercise for strengthening abdominal muscles. They are a great way to tighten the lower abs and help you get six pack abs. Jack knife sit ups will give your abs challenging workout, but the basics are easy to master!", imagePath: "abs1", tips: ["If you’ll be exercising on a hard floor, lay down an exercise mat before you begin","Use slow, controlled motions so you don't injure your back."], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Declined Leg Raise", description: "This exercise trains the transverse and the lower area of the abs, although the entire abs are strengthened. Additionally, the hip muscles (Iliopsoas and Tensor fasciae latae) are required.", imagePath: "abs2", tips: ["Bend the legs to make the exercise easier","Use weight cuffs or clamp a dumbbell between your feet to impede your abs workout"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Sit-up", description: "Performing sit ups regularly can help to improve core strength but this does not target fat loss to this body part. One of the many reasons sit ups are ever-popular is that they're easy to modify so you can continue to challenge yourself as your core strength improves.", imagePath: "abs3", tips: ["To get the most from each sit up perform the exercise slowly or in a controlled manner.", "Ensure you leave at least one day's rest between ab workouts to give your core time to recover."], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Cable Side Bend", description: "The cable side bend is simply a variation of the side bend typically performed using dumbbells. It’s utilized to build the oblique muscles of the core, which gives the midsection a more aesthetic appearance and helps to create the V-taper look.", imagePath: "abs4", tips: ["Do not move your arm as you bend your body. Grab the handle tightly and lock your shoulder into place.","Do not use momentum to bend. Use your abs and obliques."], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Declined Sit-up", description: "A decline situp bench positions your upper body at an angle so that it’s lower than your hips and thighs. This positioning causes your body to work harder, since you have to work against gravity and through a wider range of motion.", imagePath: "abs5", tips: ["Cross your arms over your chest, or interlace your fingers around the base of your skull.","Lift your torso up to bring your chest to your thighs, pause here for a few seconds, then return ."], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Seated Cable Crunch", description: "Cable crunches, also known as kneeling cable crunches, are a weighted crunch variation that target your abdominal muscles.", imagePath: "abs6", tips: ["Don't pivot at the hips. Crunch in and bring your head down towards your upper thighs.","Don't pivot at the hips. Crunch in and bring your head down towards your upper thighs."], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            
            Exercise(name: "Knee-ups", description: "Knee-ups is among the best exercises for targeting the lower abs while working out your entire core.", imagePath: "abs7", tips: ["To make the knee up easier, decrease the distance between the bench and your hips during the initial part of the movement.","To make the knee up more difficult, consider using a decline bench."], targetMuscle: Exercise.TargetMuscle.abs.rawValue)
            

        ]
    
    static var bicepExercises =
        [

            Exercise(name: "Concentration Curl", description: "By activating both the long head and short head of your biceps brachii, concentration curls are one of the most useful exercises for toning the shape of your biceps.", imagePath: "bi1", tips: ["Maintain a slight bend in the elbow at the bottom of the movement in order to keep tension through the biceps.","Using a slow eccentric of the exercise can help to improve tension and mind muscle connection."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Close Grip EZ Bar Curl", description: "Close grip EZ bar curls are an excellent exercise for working the biceps muscles, especially the long head. This is because by using a narrow grip, you naturally shift the tension onto the outer muscle fibers of your biceps, which can make them look more peaked over time.", imagePath: "bi2", tips: ["Keep your elbows locked to your sides and your body still. Only your forearms should move.","An easy way to remember whether you’re working the short/inner or long/outer is to look in the mirror."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Cable Hammer Curls", description: "The cable rope hammer curl is a popular arm-focused exercise performed with a rope handle attached by a cable to a weight stack. It uses a neutral (palms facing one another) grip, which targets the forearms and brachialis muscles in addition to the biceps.", imagePath: "bi3", tips: ["The upper arms should be tucked to your sides.","You can use a thumbless grip as shown in the above video to better emphasize the forearm muscles."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Hammer Curl", description: "The hammer curl, also known as the dumbbell hammer curl or the neutral grip dumbbell curl, is a strength training exercise that targets your biceps and forearms.", imagePath: "bi4", tips: ["Slowly straighten your elbows to return to the starting position","Come to a complete stop at the bottom before beginning another repetition."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Machine Bicep Curl", description: "The biceps curl is a highly recognizable weight-training exercise that works the muscles of the upper arm, and to a lesser extent, those of the lower arm.", imagePath: "bi5", tips: ["Concentrate on proper form rather than rapid execution. Lift the weights with a smooth motion, taking as much time to lower the weight as you do to lift it.","The position of your elbows should not change during the curl."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Unilateral Curl", description: "The unilateral curl focuses on Biceps Brachii and Brachioradialis muscles. There are a lot of variants that could work but all mainly focus on these two muscles.", imagePath: "bi6", tips: ["Do not swing your body and use momentum to curl the weight up during the exercise. If you find yourself swinging, decrease your weight.","Focus on consciously contracting / flexing the bicep muscle during the curl."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            
            Exercise(name: "Seated Bicep Curl", description: "Performing dumbbell curls while you're seated allows you to more easily use special equipment and helps you better isolate your biceps. This is because the bench or chair serves to stabilize the body.", imagePath: "bi7", tips: ["Sit on a preacher bench with your feet flat on the floor","Exhale as you raise the dumbbell toward your shoulder while keeping the rest of your body still. Contract your biceps as the weight reaches its peak."], targetMuscle: Exercise.TargetMuscle.biceps.rawValue)
            

        ]
    
    static var tricepExercises =
        [

            Exercise(name: "Dumbbell Kickback", description: "The bent over dumbbell tricep kickback is a classic tricep exercise that has been used for ages. The point of this exercise is to get a good contraction on the triceps and establish a mind-muscle connection.", imagePath: "tri1", tips: ["Hinge forward from the hips, there shouldn’t be excessive curvature within the lumbar spine.","Don’t overextend through the lumbar spine, keep some tension through the abdominals."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Overhead Extention", description: "The seated dumbbell tricep extension is a variation of the dumbbell tricep extension and an exercise used to isolate the muscles of the triceps.", imagePath: "tri2", tips: ["Don’t overextend through the lumbar spine, keep your ribcage down by maintaining tension through the abs and glutes.","Keep the head in a fairly neutral position."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Tricep Pushdown", description: "The triceps pushdown is one of the best exercises for triceps development. While the versatile upper-body workout is usually done on a cable machine (a fixture at most gyms), you can also perform a version of the move at home or on the go using a resistance band.", imagePath: "tri3", tips: ["Check in to be sure you push down smoothly and evenly with both arms.","Don’t allow your elbows to flare outward on the downward push."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Cable Overhead Ex", description: "The overhead rope tricep extension is a variation of the rope tricep extension and an exercise used to build the muscles of the triceps.", imagePath: "tri4", tips: ["If you want to keep more tension in the triceps, don’t lock the elbows out entirely.","Don’t allow the rope to pull you backwards or cause you to overarch throughout your lumbar spine."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Reverse Pulldown", description: "The reverse-grip lat pull-down is variation on the lat pull-down that targets the lower lats more than an overhand grip.", imagePath: "tri5", tips: ["Focus on your breathing while doing this excercise.","Keep your posture fixed throughout the rep."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Tricep Pushup", description: "There are two tricep pushups that are commonly used, diamon and wide arms. These two focus on the tricep muscles.", imagePath: "tri6", tips: ["Slow and steady helps to build the core.","Add weights on your back for a more challenging workout."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            
            Exercise(name: "Skullcrusher", description: "The lying triceps extension is an isolation exercise that builds the triceps muscle group in the back of the upper arm. It is also called the skull crusher because if you use poor form, you could endanger your skull. It can be incorporated into an upper-body muscle-building workout.", imagePath: "tri7", tips: ["Keep a firm grip to keep the weight from accidentally slipping from your hands and potentially causing damage or injury to your head or face.","Keep your hands about shoulder-width apart during this movement."], targetMuscle: Exercise.TargetMuscle.triceps.rawValue)
            

        ]
    
    
    
    /* OLD
     static var schedules =
     [Schedule(dateCreated: getDefaultDate(), name: "Full Body Workout", playsCounter: 0,exercises: [tricepExercises[0],bicepExercises[0],shoulderExercises[0],backExercises[0],chestExercises[0],legExercises[0],absExercises[0]])]
     static var activatedSchedule:String = "Full Body Workout"
     */
    
    //instance of user
    static var user = User(activeSchedule: schedules[0])
    // Creating a default schedule
    // What shows when the app is opened for the very first time
    static var schedules =
        [Schedule(dateCreated: getDefaultDate(), name: "None", playsCounter: 0,exercises:[])]
    static var activatedSchedule:String = "None"
    static var activatedScheduleIndex: Int = 0
    
    // default sorting options
    static var currSelectedSortOption:String = "dateCreated"
    static var ascOrDesc = "desc"
    
    // Used for testing date created sort and well why not use it as default as well...?
    static func getDefaultDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: "2020-06-08")
        
        if let unwrappedDate = date {
            return unwrappedDate
        }
        
        return Date()
    }
}
