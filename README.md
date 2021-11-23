# FinalProject

# Overview
This is a team project. In this project, we created a beach website project called "Waves". The project allows non-authenticated visitors to access retrieving data, authenticated users to access C.R.U.D. functionality a visitor cannot, and authenticated and privileged admin to access data regular users cannot.

# How to Use
Please visit http://3.137.114.88:8080/Waves/#/home.  On the Home page, options are displayed in the left taskbar. Non-authenticated visitors can look at beach list, search beaches by keyword, search beaches by rating and search the nearest beaches to the beaches and their details. Please Login as "fred" with the password "fred" to create or update a weather or report comment. To access the maintain menu, please use "yanyan" with the password "yanyan" to login as an admin to enable/disable the beaches and users, and create new beaches. If a user is disabled, it is going to fail to login with this user. Register will fail if the new username if the username is already registered(in the database).

(Sometimes the format of the page can look a little off but increasing or decreasing magnification seems to help depending on what computer you use it on)

We created a happy path with some pages formatted to show the capabilities of the site. First we start at the home page, then we click on show beaches and select the first beach to check its info. Then we head to login/register and log into a user: fred, password: fred. That will bring you to your user info page. next head back home and search by nearest beach, type in 11220, select Coney Island Beach, you now had the ability to favorite beaches as well as leave comments, try it out. We can now check out beaches by rating. Select Ulua Beach Park from the top rated list and add it to your favorites. Now lets check out beaches by keyword, type in sea and select Kamehameha Beach, you will see our keyword was found in the description. Also Add this beach to your favorites. Now head over to user profile, as you can see your favorite beaches were saved to your profile where you can click and show the individual information for each one. try seeing if the maintain page works. Hmm, well head on over to logout and sign out, then head back to login/register and login as user: john, password: john. Now, if you remember back on the Coney Island Beach page Fred had left a comment about a Tsunami which was clearly not true, so now that we are signed in as an admin we can go ahead and head to maintain and disable Freds account for making up false information about beach conditions. We can now head to beach operations from the taskbar on the left of the page and if a beach were truly closed due to some reason we could mark it so by clicking close/open to make users aware, as well as if we go to the bottom of the page we can add a new beach to our database. Now let us logout and try to log back in with our disabled fred account, you will recieve an error. Instead lets now register an account by clicking on register in the taskbar on the left. If you try to register with fred or john or any user already in the database you will get an error. Create a profile. explore the site, Thank you this was our happy path.

ERRORS: 
If you cannot log in with fred, log in with an admin account username and password are the same for any admin. (john, cindy, yanyan, kristen)
head to maintain and enable freds account.

# Technologies Used
* Java REST
* Angular
* MySQL Workbench
* Postman
* AWS
* Figma (Wireframes)
* JPA
* Git Github
* Agile
* HTML5 CSS

# Lessons Learned
In this project, we have four teammates. We discussed the design and listed the API, and communicated all the time through zoom. We had a lot of fun during the project. It is great experience to learn from each other. We also had some issues that we could not figure it out, and we don't want to get stuck too long since we had a deadline for this project, so we seek help from instructors. I plan to do some projects later, and try to get used to the issues that might happen, and try to solve them 100% independently with anybody's help.
