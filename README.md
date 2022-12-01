<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [📜 Requirements](#requirements)
- [💡 Approach](#approach)
<!-- PROJECT DESCRIPTION -->

# 📖 Helpjuice's rails take-home task <a name="about-project"></a>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Libraries and Frameworks</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://tailwindcss.com/">Tailwindcss</a></li>
    <li><a href="https://relishapp.com/rspec/rspec-rails/docs">Rspec</a></li>
    <li><a href="https://turbo.hotwired.dev/">Hotwired Turbo</a></li>
    <li><a href="https://stimulus.hotwired.dev/">StimulusJS</a></li>

  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Simple Authentication:** This project has a simple layer of authentication by name, used to associate data to specific users.
- **Live Search Box:** Powered by turbo and stimulusJS, user is able to filter results almost instantly from the server.
- **Analytics:** Once the user has finished his query, this last one is saved and used to display some basic analytics.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://helpjuice-searchbox.fly.dev/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Ruby
- Rails
- Postgresql
- Bundler

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:anagudelogu/helpjuice.git
```

### Install

Install this project with:

```sh
  cd helpjuice
  bundle install
```

### Usage

To run the project, execute the following command:

```sh
  bin/dev
```

Note, if you're using Windows, you should run this command instead:

```sh
  ruby bin/rails server -p 3000 && ruby bin/rails tailwindcss:watch
```

### Run tests

To run tests, run the following command:

```sh
  bundle exec rspec -fd
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Requirements -->

# 📜 Requirements <a name="requirements"></a>

To create a realtime search box, where users search articles, and then to have analytics that display what users were searching for.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Approach -->

# 💡 Approach <a name="approach"></a>

The way I decided to approach this was by dividing the task based on three main points:

- I needed a way to identify users so I can gather specific information about a user and display analytics around it. I choose a very simple layer of authentication with a name that checks for the existence of this one in the database, if it exists, select it, and in the other case, create it.

- I also needed to provide a way for users to type and filter the results live, I choose `turbo` and `stimulus` for this purpose. The flow worked like this:

  - The user types.
  - On each input, the search form gets submitted.
  - A `turbo_stream` template is rendered in a target HTML element.

  Looks pretty simple and straightforward. However, as this is a server search box, firing queries on each input could seriously affect the performance having a large-scale app. I needed a way to debounce these queries, so I choose a simple yet effective debouncer using JavaScript: Once the user typed, clear a timer (if exists), and then set a new one to 300ms, once this timer ends, then the form gets submitted and the flow continued.

- I finally needed a way to use what the users were searching to display some analytics. This brought a new challenge to the table: _`When do users finish their queries?`_

  I got some ideas on how to manage this, some of them were hardcoded and included some "magic" numbers, such as fixed timers, for example. In the end, I choose to go with what I was expecting the users to do. As this is an app that filters articles, I expect that the user is going to click the article once the query has finished. So, my application collects query data whenever the user loses focus on the input. There's no perfect approach to handle this, there are still a lot of edge cases to consider, but for the time given I considered this the better option.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
