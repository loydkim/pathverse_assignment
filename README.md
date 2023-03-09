# Pathverse Assignment

| iOS  | Android |  Web |
| :---------------: | :---------------: | :---------------: |
| [![](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_ios.gif)](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_ios.gif) | [![](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_android.gif)](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_android.gif) | [![](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_web.gif)](https://github.com/loydkim/pathverse_assignment/blob/main/pathverse_web.gif) |

* Features

(1) Login screen

- Validate the email format. ( If the format is wrong, display an error message and stay on the login page )
- Add obscure option to show or hide password on password text field

(2) Home landing

- Once logged in, the user can see a sidebar and the homepage ( The sidebar can be collapsed or extended with a button click )
- A list of posts that shows 20 posts first and if the user scrolls down, the list adds 20 more posts.
- If the body of contents text lines are long, show only 4 lines of text with "Read more" text. if touch "Read more" show all text.
- The App bar includes menu, search, and notification buttons. If touch the menu button, show or hide the sidebar.
- For each post, display their title and description and the user ID. The user can be clickable and when clicked on, move to the user page.
- For each post, also display a Comments button, when clicked on, move to the comment page.
- On home landing, it makes a difference user's color randomly to distinguish the user.

(3) User 

- The App bar type is Sliver App bar. So if the user scrolls up, the app bar will be hidden. if scrolling up, the app bar will appear.
- If the body of contents text lines are long, show only 4 lines of text with "Read more" text. if touch "Read more" show all text.
- For each post, display a Comments button, when clicked on, displays all the comments related to that post.

(4) Comment

- Show current post content and all comments list.
- If touch the more button, it shows Report, Block dropdown button.

* Develop environment

- Computer: Apple Mac Mini M2 
- OS: Ventura 13.2
- Flutter SDK version: 3.3.10 on channel stable
- VS Code version: 1.76.0
- Xcode: 14.2
- Android: 33.0.1
