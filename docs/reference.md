# Reference 

## Create hash

### Description

Create a custom authentication token required by the podcastindex api
utilizing the podcastindex API key and secret pair

### Usage

    create_hash(epoch_time = NULL)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>epoch_time</code></td>
<td><p>string of time in UTC unix format. If NULL, the current system
time will be used.</p></td>
</tr>
</tbody>
</table>

### Value

string representing hash (sha1) of API key, secret and epoch time
created with the `digest` package


---
## Episodes byfeedid

### Description

`episodes_byfeedid()` obtains all episodes from the a podcast specified
by one or more PodcastIndex feed ID(s)

### Usage

    episodes_byfeedid(feedid, max = 10, fulltext = FALSE, since = NULL)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>feedid</code></td>
<td><p>vector of one or more integers representing PodcastIndex Feed
IDs.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>since</code></td>
<td><p>optional date string in format <code>YYYY-MM-DD</code> that when
specified will only return podcasts/episodes created since the specified
date.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with episodes

### Examples

```r
# Requires API key and secret

episodes_byfeedid(feedid = 920666)
```


---
## Episodes byguid

### Description

`episodes_byguid()` obtains metadata for a single episode from a podcast
specified by a guid and either a feed ID or URL

### Usage

    episodes_byguid(guid, feedurl = NULL, feedid = NULL, fulltext = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>guid</code></td>
<td><p>character string of guid value for episode to retrieve</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>feedurl</code></td>
<td><p>character string of podcast feed URL</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>feedid</code></td>
<td><p>vector of one or more integers representing PodcastIndex Feed
IDs.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with the episode

### Examples

```r
# Requires API key and secret

# using guid and feedid

episodes_byguid(guid = "PC2084", feedid = 920666)

# using guid and feedurl
episodes_byguid(guid = "PC2084", feedurl = "http://mp3s.nashownotes.com/pc20rss.xml")
```


---
## Episodes byid

### Description

`episodes_byid()` obtains all metadata associated with a single episode
specified by ID.

### Usage

    episodes_byid(id, fulltext = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>id</code></td>
<td><p>integer of the PodcastIndex episode ID to search for.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with the episode

### Examples

```r
# Requires API key and secret

episodes_byid(id = 75075)
```


---
## Episodes byurl

### Description

`episodes_byfeedid()` obtains all episodes from the a podcast specified
by a feed URL

### Usage

    episodes_byurl(url, max = 10, fulltext = FALSE, since = NULL)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>url</code></td>
<td><p>character string of podcast feed URL</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>since</code></td>
<td><p>optional date string in format <code>YYYY-MM-DD</code> that when
specified will only return podcasts/episodes created since the specified
date.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with episodes

### Examples

```r
# Requires API key and secret

episodes_byurl(url = "https://engineered.network/pragmatic/feed/index.xml")
```


---
## Episodes live

### Description

`episodes_live()` obtains metadata for episodes that have the
podcast-liveitem tag enabled in the feed, meaning episodes airing live
at the time of running this function.

### Usage

    episodes_live(max = 10)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with live episodes

### Examples

```r
# Requires API key and secret

episodes_live(max = 20)
```


---
## Episodes random

### Description

`episodes_random()` obtains a random selection of podcast episodes from
the Podcast Index database

### Usage

    episodes_random(
      max = 2,
      lang = "en",
      cat_terms = NULL,
      notcat_terms = NULL,
      fulltext = FALSE
    )

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>lang</code></td>
<td><p>optional two-letter language code that when specified will only
return podcasts/episodes having that specific language.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>cat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes under those
categories.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>notcat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes not under those
categories.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with episodes

### Examples

```r
# Requires API key and secret

episodes_random(max = 20)
```


---
## Episodes recent

### Description

`episodes_recent()` obtains the most recent `max` number of podcast
episodes across the entire PodcastIndex database, sorted in reverse
chronological order.

### Usage

    episodes_recent(
      max = 7,
      exclude_string = NULL,
      before = NULL,
      fulltext = FALSE
    )

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>exclude_string</code></td>
<td><p>character string used to exclude any episodes with title or URL
containing the specified string.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>before</code></td>
<td><p>episode ID string that when specified will only return episodes
created before the specified episode ID, allowing you to walk back
through episode history sequentially.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with episodes

### Examples

```r
# Requires API key and secret

episodes_recent(max = 20)
```


---
## Feeds bymedium

### Description

`feeds_bymedium` obtains all feeds marked with the specified medium tag
value.

### Usage

    feeds_bymedium(
      medium = c("audiobook", "blog", "film", "music", "newsletter", "podcast", "video")
    )

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>medium</code></td>
<td><p>character string of medium to search for. Must be one of
<code>audiobook</code>, <code>blog</code>, <code>film</code>,
<code>music</code>, <code>newsletter</code>, <code
style="white-space: pre;">⁠podcast,⁠</code> or <code>video</code></p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feeds

### Examples

```r
## Not run: 
# Requires API key and secret

feeds_bymedium(medium = "film")

## End(Not run)
```


---
## Feeds new

### Description

feeds\_recent()' retrieves the newest podcast feeds added to the
podcastindex over the past 24 hours.

### Usage

    feeds_new(max = 60, since = NULL, feedid = NULL, desc = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>since</code></td>
<td><p>optional date string in format <code>YYYY-MM-DD</code> that when
specified will only return podcasts/episodes created since the specified
date.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>feedid</code></td>
<td><p>string of the Podcastindex Feed ID to start from (or go to if
<code>desc</code> is set to TRUE). If <code>since</code> is specified,
<code>feedid</code> takes precedence.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>desc</code></td>
<td><p>boolean to display feeds in descending order. Only applicable
when specifying <code>feedid</code>.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with new feeds

### Examples

```r
# Requires API key and secret

feeds_new(max = 20)
```


---
## Feeds recent

### Description

`feeds_recent()` retrieves the most recent podcast feeds added to the
podcastindex.

### Usage

    feeds_recent(
      max = 40,
      lang = "en",
      since = NULL,
      cat_terms = NULL,
      notcat_terms = NULL
    )

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>lang</code></td>
<td><p>optional two-letter language code that when specified will only
return podcasts/episodes having that specific language.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>since</code></td>
<td><p>optional date string in format <code>YYYY-MM-DD</code> that when
specified will only return podcasts/episodes created since the specified
date.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>cat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes under those
categories.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>notcat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes not under those
categories.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with recent feeds in
chronological order

### Examples

```r
# Requires API key and secret

feeds_recent()

feeds_recent(max = 100, since = "2021-01-01", cat_terms = c("News", "Finance"))
```


---
## Feeds trending

### Description

`feeds_trending()` obtains the feeds in the Podcast Index that are
trending.

### Usage

    feeds_trending(
      max = 10,
      lang = "en",
      since = NULL,
      cat_terms = NULL,
      notcat_terms = NULL
    )

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>max</code></td>
<td><p>Maximum number of results to return. Value must be a single
integer between 1 and 1000.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>lang</code></td>
<td><p>optional two-letter language code that when specified will only
return podcasts/episodes having that specific language.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>since</code></td>
<td><p>optional date string in format <code>YYYY-MM-DD</code> that when
specified will only return podcasts/episodes created since the specified
date.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>cat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes under those
categories.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>notcat_terms</code></td>
<td><p>optional character vector of one or more categories that when
specified will only return podcasts/episodes not under those
categories.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feeds


---
## Feeds withvalue

### Description

`feeds_withvalue` obtains all feeds from the Podcast Index database that
support the `value` tag in the podcast namespace

### Usage

    feeds_withvalue()

### Value

`tibble` data frame with metadata associated with feeds

### Examples

```r
## Not run: 
# Requires API key and secret

feeds_withvalue()

## End(Not run)
```


---
## Get podcastindex api keys

### Description

Obtain the podcastindex API key and secret values from a `.Renviron`
file, either stored in the current directory or the user's home
directory.

### Usage

    get_podcastindex_api_keys()

### Value

list with API key and API secret values


---
## Podcastindex api isset

### Description

Detect if podcastindex API key/secret pair is defined

### Usage

    podcastindex_api_isset()

### Value

boolean, TRUE if both `PODCASTINDEX_API_KEY` and
`PODCASTINDEX_API_SECRET` environment variables are defined in the
current R session.


---
## Podcasts byfeedid

### Description

`podcasts_byfeedid()` obtains all available metadata from the Podcast
Index database associated with a particular feed ID

### Usage

    podcasts_byfeedid(feedid)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>feedid</code></td>
<td><p>integer representing a Podcast Index feed ID</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feed

### Examples

```r
# Requires API key and secret

podcasts_byfeedid(feedid = 920666)
```


---
## Podcasts byfeedurl

### Description

`podcasts_byfeedurl()` obtains all available metadata from the Podcast
Index database associated with a particular feed URL

### Usage

    podcasts_byfeedurl(url)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>url</code></td>
<td><p>character string of podcast feed URL</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feed

### Examples

```r
# Requires API key and secret

podcasts_byfeedurl(url = "https://feeds.theincomparable.com/batmanuniversity")
```


---
## Podcasts byguid

### Description

`podcasts_byfeedguid()` obtains all available metadata from the Podcast
Index database associated with a particular feed GUID

### Usage

    podcasts_byguid(guid)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>guid</code></td>
<td><p>string representing a Podcast Index feed GUID</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feed

### Examples

```r
# Requires API key and secret

podcasts_byguid(guid = "9b024349-ccf0-5f69-a609-6b82873eab3c")
```


---
## Podcasts byitunesid

### Description

`podcasts_byitunesid()` obtains all available metadata from the Podcast
Index database associated with a particular iTunes ID

### Usage

    podcasts_byitunesid(itunesid)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>itunesid</code></td>
<td><p>integer representing a Podcast Index iTunes feed ID</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feed

### Examples

```r
# Requires API key and secret

podcasts_byitunesid(itunesid = 1441923632)
```


---
## Podcasts categories

### Description

`podcasts_categories()` obtains all of the possible categories supported
by the Podcast Index.

### Usage

    podcasts_categories()

### Value

`tibble` data frame with category id and name

### Examples

```r
# Requires API key and secret

podcasts_categories()
```


---
## Search apple byterm

### Description

`search_apple_byterm()` replaces the Apple search API but uses the
Podcast Index database instead.

### Usage

    search_apple_byterm(term)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>term</code></td>
<td><p>character string of the term to search for</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with podcasts that match
the search term

### Examples

```r
search_apple_byterm("metal")
```


---
## Search apple lookup

### Description

`search_apple_lookup()` replaces the Apple podcast lookup api but uses
the Podcast Index database instead.

### Usage

    search_apple_lookup(feedid)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>feedid</code></td>
<td><p>integer of the iTunes feed ID to search for.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with podcasts that match
the feed ID

### Examples

```r
search_apple_lookup(feedid = 1441923632)
```


---
## Search byperson

### Description

`search_byperson()` performs a search of podcast episodes where the
specified person is mentioned.

### Usage

    search_byperson(q, fulltext = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>q</code></td>
<td><p>character string of the person to search for</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with episodes that mention
the person specified in the search query.

### Examples

```r
# Requires API key and secret

search_byperson(q = "Adam Curry")
```


---
## Search byterm

### Description

`search_byterm()` performs a search of the `title`, `author`, or `owner`
of podcasts feeds within the PodcastIndex.

### Usage

    search_byterm(q, val = NULL, aponly = TRUE, clean = TRUE, fulltext = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>q</code></td>
<td><p>character string of the term(s) to search for</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>val</code></td>
<td><p>string indicating which value block type to filter search
results. Valid entries are <code>any</code>, <code>lightning</code>,
<code>hive</code>, or <code>webmonetization</code>.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>aponly</code></td>
<td><p>boolean to only return feeds with an itunesId present</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>clean</code></td>
<td><p>boolean to only return non-explicit podcast feeds. Meaning feeds
where the <code>itunes:explicit</code> flag is set to false.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feeds that match the
search terms in the `title`, `author`, or `owner` fields.

### Examples

```r
# Requires API key and secret

search_byterm(q = "batman university")
```


---
## Search bytitle

### Description

`search_byterm()` performs a search of the `title` field of podcasts
feeds within the PodcastIndex.

### Usage

    search_bytitle(q, val = NULL, clean = TRUE, fulltext = FALSE, similar = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>q</code></td>
<td><p>character string of the term(s) to search for</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>val</code></td>
<td><p>string indicating which value block type to filter search
results. Valid entries are <code>any</code>, <code>lightning</code>,
<code>hive</code>, or <code>webmonetization</code>.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>clean</code></td>
<td><p>boolean to only return non-explicit podcast feeds. Meaning feeds
where the <code>itunes:explicit</code> flag is set to false.</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>similar</code></td>
<td><p>boolean to include similar matches in search response</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feeds that match (or
similar to) the search terms in the `title` fields.

### Examples

```r
# Requires API key and secret

search_bytitle(q = "batman university")
```


---
## Search music

### Description

`search_music()` performs a search of the `title`, `author`, or `owner`
of podcast feeds within the PodcastIndex where the medium is music.

### Usage

    search_music(q, val = NULL, aponly = TRUE, clean = TRUE, fulltext = FALSE)

### Arguments

<table>
<tbody>
<tr class="odd" style="vertical-align: top;">
<td><code>q</code></td>
<td><p>character string of the term(s) to search for</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>val</code></td>
<td><p>string indicating which value block type to filter search
results. Valid entries are <code>any</code>, <code>lightning</code>,
<code>hive</code>, or <code>webmonetization</code>.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>aponly</code></td>
<td><p>boolean to only return feeds with an itunesId present</p></td>
</tr>
<tr class="even" style="vertical-align: top;">
<td><code>clean</code></td>
<td><p>boolean to only return non-explicit podcast feeds. Meaning feeds
where the <code>itunes:explicit</code> flag is set to false.</p></td>
</tr>
<tr class="odd" style="vertical-align: top;">
<td><code>fulltext</code></td>
<td><p>boolean to return the full text value of any text fields within
the result data. If set to FALSE, all text fields are truncated to 100
words.</p></td>
</tr>
</tbody>
</table>

### Value

`tibble` data frame with metadata associated with feeds that match the
search terms in the `title`, `author`, or `owner` fields.

### Examples

```r
# Requires API key and secret

search_music(q = "metal")
```


---
