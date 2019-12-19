<img src="https://github.com/itggot-adrian-almetunsmeds/magic-mirror-gosu/workflows/Linting/badge.svg" alt="Linting status">
<img src="https://github.com/itggot-adrian-almetunsmeds/magic-mirror-gosu/workflows/Docs/badge.svg" alt="Documentation status">

# magic-mirror-gosu
A Magic Mirror front-end created in Ruby using Gosu.

This project requires the use of itggot-adrian-almetunsmeds/Magic-Mirror-Backend 


### Setup
   1. Download all dependencies
   2. Start the magic-mirror-backend webserver
   3. Navigate to the webserver admin panel using a browser
   4. Set up a user and fill in all the required forms
   5. Navigate to the webserver example ```http://localhost:9292/token/:user_id``` page using a browser (replace :user_id with the user ID from the user created in 4.)
   6. Insert the retrived token in ```token.txt```
   7. In the terminal run ``` ruby app.rb ```
