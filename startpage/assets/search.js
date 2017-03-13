var box = document.getElementById("search");

// catch URLs
var urlPattern = /^(https?:\/\/)?[^ ]+[.][^ ]+([.][^ ]+)*(\/[^ ]+)?$/i;

// convenient links
var handy = /^(google|gmail|dropbox|github)$/i;

// search for text in text box
function search() {
  console.log("Googling \"" + box.value + "\"");
  console.log("Encoded query: \n" + encodeURIComponent(box.value));
  document.location.href = "https://www.duckduckgo.com/" + encodeURIComponent(box.value);
}

// if not search text, navigate to URL
function nav(address) {
  // if the address starts with "https?|ftp ://"
  if (/^(?:(?:https?|ftp):\/\/).*/i.test(address)) {
    document.location.href = address;
  } else {
    document.location.href = "http://" + address;
  }
}

// handle enter key press in text box
// if text is a command, handle command parsing
function searchKeyPress(e) {
  e = e || window.event;
  if (e.keyCode == 13) {
    parseCom(box.value);
  }

  // first, handle known cases of preset commands
}

// parse command
function parseCom(com) {
  // handle convenient links
  if (handy.test(com)) {
    nav("http://www."+com+".com/");
  }

  // handle "drive" command
  else if (/^drive$/i.test(com)) {
    nav("http://drive.google.com");
  }

  // handle "reddit" command
  else if (com.startsWith("reddit")==true) {
    // if "reddit" command is matched, open reddit
    if (/^reddit$/i.test(com)) {
      nav("https://www.reddit.com/");
    }
    // if the subreddit command is matched
    else if (/^reddit -r .*$/i.test(com)) {
      var sargs = com.split(" ");
      nav("https://www.reddit.com/r/" + sargs.pop());
    }
    // if the user command is matched
    else if (/^reddit -u .*$/i.test(com)) {
      var uargs = com.split(" ");
      nav("https://www.reddit.com/u/" + uargs.pop());
    }
    // if any of the custom subreddit commands are matched
    else if (/^reddit [A-Za-z]{2,2}$/i.test(com)) {
      var subargs = com.split(" ");
      switch (subargs.pop()) {
        case "bs":
          nav("https://www.reddit.com/r/battlestations/");
          break;
        case "pc":
          nav("https://www.reddit.com/r/pcmasterrace/");
          break;
        case "up":
          nav("https://www.reddit.com/r/unixporn/");
          break;
        case "sp":
          nav("https://www.reddit.com/r/startpages/");
          break;
        default:
          nav("https://www.reddit.com/");
          break;
        }
    }
    // if anything else, search for it
    else if (urlPattern.test(com)){
      nav(com);
    }
    // if all else fails, search for it
    else {
      search();
    }
  }

  // handle "twt"" command
  else if (com.startsWith("twt")==true) {
    // if "twt" command is matched, open twitter
    if (/^twt$/i.test(com)) {
      nav("https://www.twitter.com/");
    }
    // if the user command is matched
    else if (/^twt -u .@?[A-Za-z0-9_]{1,15}$/i.test(com)) {
      var targs = com.split(" ");
      nav("https://www.twitter.com/" + targs.pop());
    }
    // if search command is matched
    else if (/^twt -s .{1,140}$/i.test(com)) {
      var query = com.replace(/^twt -s /i, "");
      nav("https://www.twitter.com/search?q=" + encodeURIComponent(query));
    }
    // if anything else, search for it
    else if (urlPattern.test(com)){
      nav(com);
    }
    // if all else fails, search for it
    else {
      search();
    }
  }

  // handle "youtube" commands
  else if (com.startsWith("youtube")==true) {
    // if "youtube" command is matched, open youtube
    if (/^youtube$/i.test(com)) {
      nav("https://www.youtube.com/feed/subscriptions");
    }
    // if search command is matched
    else if (/^youtube -s .{1,140}$/i.test(com)) {
      var query = com.replace(/^youtube -s /i, "");
      nav("https://www.youtube.com/results?search_query=" + encodeURIComponent(query));
    }
    // if anything else, search for it
    else if (urlPattern.test(com)){
      nav(com);
    }
    // if all else fails, search for it
    else {
      search();
    }
  }

  // handle "ig" command
  else if (com.startsWith("ig")==true) {
    // if "ig" command is matched, open instagram
    if (/^ig$/i.test(com)) {
      nav("https://www.instagram.com/");
    }
    // if the user command is matched
    else if (/^ig -u .@?[A-Za-z0-9_.]{1,30}/i.test(com)) {
      var iargs = com.split(" ");
      nav("https://www.instagram.com/" + iargs.pop());
    }
    // if anything else, search for it
    else if (urlPattern.test(com)){
      nav(com);
    }
    // if all else fails, search for it
    else {
      search();
    }
  }

  // handle "ttv"" command
  else if (com.startsWith("twitch")==true) {
    // if "ttv" command is matched, open twitch
    if (/^ttv$/i.test(com)) {
      nav("http://www.twitch.tv/");
    }
    // if search command is matched
    else if (/^ttv -u .[^ ]+$/i.test(com)) {
      var parts = com.split(" ");
      nav("http://www.twitch.tv/" + parts.pop());
    }
    // if anything else, search for it
    else if (urlPattern.test(com)){
      nav(com);
    }
    // if all else fails, search for it
    else {
      search();
    }
  }
}
