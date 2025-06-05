# WebGL GitHub Pages Deployment Instructions

- Make sure you have WebGL build support installed for Unity (Check in Unity Hub).
- Under `File > Build Settings`, make sure WebGL is selected as the build platform
- Ensure 'Scenes/MainMenu' is checked as the first scene and 'Scenes/Game' is selected second.
- Set the code optimization to `Runtime speed`.
- Save the build in the following path relative to the root of this project `Build/Academical3_Web`. The path must be exact for the deployment commands below to work.
- Make sure NPM is installed. It is installed with NodeJS. We use the 'gh-pages' package to push the build to the 'gh-pages' branch.
- Run `npm install` to install packages used to deploy the game to GitHub.
- Run `npm run deploy` to deploy. If you're on windows, run the following instead `npx gh-pages -d .\Build\Academical3_Web --nojekyll`.
- Wait
- The game should now be visible under the Actions tab on the GitHub repo site.
