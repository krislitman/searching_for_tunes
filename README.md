<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!-- [![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url] -->



<!-- PROJECT LOGO -->
<br />
<!-- <p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

  <h3 align="center">Searching for Tunes</h3>
  
  <br>
  
  <h4 align="center">Search through new releases on Spotify to find new tracks by Artist or Album!</h4>

  <!-- <p align="center">
    Search through Artists and Songs on Spotify to find great new music!
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View Demo</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Report Bug</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Request Feature</a>
  </p>
</p> -->



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

#### Endpoints

**GET '/api/v1/new_releases'**

<p>Return new albums from Spotifys API, include an optional parameter of <page> to return more albums</p>
 
<p>Example response: </p>
  
```
{
    "data": [
        {
            "id": "1",
            "type": "album",
            "attributes": {
                "name": "Go Away",
                "spotify_id": "1nETLIyhtk8GjuqyfOt1G7",
                "release_date": "2021-07-08",
                "album_type": "album"
            }
        },
        {
            "id": "2",
            "type": "album",
            "attributes": {
                "name": "Stay (with Justin Bieber)",
                "spotify_id": "4QLAtpLNUsHEYrcHXmMIZZ",
                "release_date": "2021-07-09",
                "album_type": "album"
            }
        },
```

**GET '/api/v1/albums_by_artist'**

<p>Performs a search to find Albums by an Artist. Must include an <artist> parameter with a search term (can be just a fragment)</p>
 
<p>Example response for a search of <Bieber>: </p>
  
```
{
    "data": [
        {
            "id": "2",
            "type": "album",
            "attributes": {
                "name": "Stay (with Justin Bieber)",
                "spotify_id": "4QLAtpLNUsHEYrcHXmMIZZ",
                "release_date": "2021-07-09",
                "album_type": "album"
            }
        }
    ]
}
```


<!-- Explain the database setup, and endpoints that are available. Also how to get your own working key for spotify to make API calls. -->

### Built With

* [Rails](https://github.com/rails/rails)
* [RSpec](https://github.com/rspec/rspec-rails)
* Postgresql
* Redis
* Postman
* VCR

<!-- GETTING STARTED -->
## Getting Started

Fork and clone the repository to have your own working local copy.

### Prerequisites

You will need:

* ruby
  ```
  ruby -v 2.5.3
  ```

* rails
  ```
  rails -v 6.1.4
  ```

### Installation

1. After cloning the repository to your machine, cd into the project

2. Make sure to run:

```
$ bundle install
```

To install dependencies

3. To run the test suite, run this command:

```
$ bundle exec rspec
```



<!-- USAGE EXAMPLES -->
## Usage

To run a local server and test the available endpoints, run the command:

```
$ rails s
```

You will need to run a Redis server as well for caching with this command:

```
$ redis-server
```

Go to localhost:3000 to try them out!


<!-- CONTACT -->
## Contact

Kris Litman - kris.d.litman@gmail.com

Project Link: [https://github.com/krislitman/searching_for_tunes](https://github.com/krislitman/searching_for_tunes)
