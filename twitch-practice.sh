# TWITCH API PRACTICE
# TWITCH API DOCS: https://dev.twitch.tv/docs/
# TWITCH DEVELOPER CONSOLE: https://dev.twitch.tv/console/
# NOTE* CLIENT SECRET, and AUTH TOKEN HAS BEEN REMOVED

# POST https://id.twitch.tv/oauth2/token
#   ?client_id=<your client ID>
#   &client_secret=<your client secret>
#   &grant_type=client_credentials
#   &scope=<space-separated list of scopes>    # <- optional

# ******************************************************************************
# 1) 
# POST request to get app access token
# POST https://id.twitch.tv/oauth2/token
#   ?client_id=uclfmcq0ndx108y8d15vfxklrrb89k
#   &client_secret=   
#   &grant_type=client_credentials


# Terminal Code
curl -X POST "https://id.twitch.tv/oauth2/token?client_id=uclfmcq0ndx108y8d15vfxklrrb89k&client_secret=&grant_type=client_credentials"


# ******************************************************************************
# 2) get acces token from response
# example JSON response is app access token 
# { 
#   "access_token":"",
#   "expires_in":4801245,   # <- what unit?!
#   "token_type":"bearer"
# }


# ******************************************************************************
# 3) make GET request (returns list of all active streams by certain users)
# Say we have a handful of curated twitch users, and we wanna see if they
# have any active streams, then we get back a list of all active streams
# - can specifiy up to 100 users
# - if you don't specify user_id, twitch sends u back list of popular streams
# - request parameters are & repeated not comma!!!!!!
# Users:
# gabrielanddresden 
# insomniac
# itsgoodtv
# paxahau
# djjazzyjeff
# elseworldtv
# chris_liebing_official
# beatportofficial
# maryle_mar

# Example 1 Request (get livestream for 1 specific user name):
# must send request with access token and client ID in header
curl -X GET 'https://api.twitch.tv/helix/streams?user_login=insomniac' \
-H 'Authorization: Bearer <insert auth token here>' \
-H 'Client-Id: uclfmcq0ndx108y8d15vfxklrrb89k'
# Example 1 Response:
# {
#    "data":[
#       {
#          "id":"40210470030",
#          "user_id":"232672264",
#          "user_name":"Insomniac",
#          "game_id":"26936",
#          "type":"live",
#          "title":" FACTORY 93 Livestream (Encore)",
#          "viewer_count":955,
#          "started_at":"2020-10-25T01:55:24Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_insomniac-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "c5247b10-deec-4d7a-84a5-db6a75cb5908",
#             "2068d8f3-269c-43f2-9a00-82aeb3f0a3b8",
#             "9f1b01a8-87b9-4e25-94de-8705c1c1f4dc",
#             "338d7a92-8bcc-429e-a30c-9f1c41a2d79a",
#             "d81d54c8-d705-4df6-aaf0-01d715c1dbcc"
#          ]
#       }
#    ],
#    "pagination":{
      
#    }
# }


# Example 2 Request (get top 20 current live streams)
# curl -X GET 'https://api.twitch.tv/helix/streams' \
# -H 'Authorization: Bearer ' \
# -H 'Client-Id: uclfmcq0ndx108y8d15vfxklrrb89k'

# Example Response 2:
# {
#    "data":[
#       {
#          "id":"40241394846",
#          "user_id":"163299585",
#          "user_name":"BLASTPremier",
#          "game_id":"32399",
#          "type":"live",
#          "title":"NAVI vs OG Esports | NiP vs Evil Geniuses 27.10 💥 BLAST Premier Fall Series Group 1",
#          "viewer_count":54589,
#          "started_at":"2020-10-27T14:28:43Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_blastpremier-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "36a89a80-4fcd-4b74-b3d2-2c6fd9b30c95"
#          ]
#       },
#       {
#          "id":"40241374398",
#          "user_id":"15564828",
#          "user_name":"NICKMERCS",
#          "game_id":"512710",
#          "type":"live",
#          "title":"Fraggin' | Code: MFAM | @NICKMERCS",
#          "viewer_count":48955,
#          "started_at":"2020-10-27T14:24:15Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_nickmercs-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"40241390446",
#          "user_id":"43691",
#          "user_name":"Faker",
#          "game_id":"21779",
#          "type":"live",
#          "title":"T1 Faker plays Sylas vs. Qiyana!",
#          "viewer_count":36280,
#          "started_at":"2020-10-27T14:27:44Z",
#          "language":"ko",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_faker-{width}x{height}.jpg",
#          "tag_ids":[
#             "ab2975e3-b9ca-4b1a-a93e-fb61a5d5c3a4"
#          ]
#       },
#       {
#          "id":"39792830940",
#          "user_id":"488686494",
#          "user_name":"winstrike_tv",
#          "game_id":"32399",
#          "type":"live",
#          "title":"[RU] NAVI vs OG (0-0) BO3 | BLAST Premier Fall Series 2020 ",
#          "viewer_count":33438,
#          "started_at":"2020-10-27T15:16:17Z",
#          "language":"ru",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_winstrike_tv-{width}x{height}.jpg",
#          "tag_ids":[
#             "0569b171-2a2b-476e-a596-5bdfb45a1327"
#          ]
#       },
#       {
#          "id":"40241173566",
#          "user_id":"600209425",
#          "user_name":"streamhd_71",
#          "game_id":"",
#          "type":"live",
#          "title":"Visit: https://iPLStream.surf/Live",
#          "viewer_count":29954,
#          "started_at":"2020-10-27T13:41:53Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_streamhd_71-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"39792121868",
#          "user_id":"66983298",
#          "user_name":"benjyfishy",
#          "game_id":"33214",
#          "type":"live",
#          "title":"TRIO CUP WITH SAVAGE AND LETSHE | !discord",
#          "viewer_count":28941,
#          "started_at":"2020-10-27T14:06:45Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_benjyfishy-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"39792287180",
#          "user_id":"35980866",
#          "user_name":"Perxitaa",
#          "game_id":"509658",
#          "type":"live",
#          "title":"1 MILLON con HORACIO",
#          "viewer_count":25156,
#          "started_at":"2020-10-27T14:24:07Z",
#          "language":"es",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_perxitaa-{width}x{height}.jpg",
#          "tag_ids":[
#             "d4bb9c58-2141-4881-bcdc-3fe0505457d1"
#          ]
#       },
#       {
#          "id":"39601737053",
#          "user_id":"47071880",
#          "user_name":"YoDa",
#          "game_id":"21779",
#          "type":"live",
#          "title":"SAGA DO CHALLENGER FIM DE SEASONDIA 2/15 - MESTRE ",
#          "viewer_count":23553,
#          "started_at":"2020-10-27T09:49:25Z",
#          "language":"pt",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_yoda-{width}x{height}.jpg",
#          "tag_ids":[
#             "39ee8140-901a-4762-bfca-8260dea1310f"
#          ]
#       },
#       {
#          "id":"40239487726",
#          "user_id":"71190292",
#          "user_name":"Trainwreckstv",
#          "game_id":"510218",
#          "type":"live",
#          "title":"raymond reddington | !twitter | !podcast",
#          "viewer_count":21165,
#          "started_at":"2020-10-27T06:46:43Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_trainwreckstv-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"40240736878",
#          "user_id":"26610234",
#          "user_name":"CohhCarnage",
#          "game_id":"513971",
#          "type":"live",
#          "title":"GHOSTRUNNER! - Thanks Devs for the key! - Hades tonight! - !Cyber Cohhlection (5 days left) - !Signed - !Coffee - #EpicPartner Code: Cohh",
#          "viewer_count":18787,
#          "started_at":"2020-10-27T11:57:27Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_cohhcarnage-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "96b6073f-450d-4248-8ed4-988e28f3f759",
#             "eaba0ad7-c4e1-4878-b37f-01308dbb65c8"
#          ]
#       },
#       {
#          "id":"40241377166",
#          "user_id":"26991127",
#          "user_name":"Hiko",
#          "game_id":"516575",
#          "type":"live",
#          "title":"100T Hiko | FirstStrike Qualifiers continue today @ 2pm PST| !bracket !tournytime !house | @Hiko on Twitter :)",
#          "viewer_count":17298,
#          "started_at":"2020-10-27T14:24:55Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_hiko-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"40240541950",
#          "user_id":"103825127",
#          "user_name":"풍월량",
#          "game_id":"510090",
#          "type":"live",
#          "title":"레이어스 오브 피어2  한글패치  공포게임         ",
#          "viewer_count":15715,
#          "started_at":"2020-10-27T11:03:57Z",
#          "language":"ko",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_hanryang1125-{width}x{height}.jpg",
#          "tag_ids":[
#             "ab2975e3-b9ca-4b1a-a93e-fb61a5d5c3a4"
#          ]
#       },
#       {
#          "id":"39792412700",
#          "user_id":"22484632",
#          "user_name":"forsen",
#          "game_id":"27471",
#          "type":"live",
#          "title":"@forsen, Please let this be it!",
#          "viewer_count":15563,
#          "started_at":"2020-10-27T14:36:56Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_forsen-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "adb55316-f1ab-4f81-9ff5-17da7719d0ee"
#          ]
#       },
#       {
#          "id":"39792181980",
#          "user_id":"86277097",
#          "user_name":"buster",
#          "game_id":"508948",
#          "type":"live",
#          "title":"Raid: Shadow Legends | БОЛЬШООООЙ СКИЛЛ #спонсор #конкурс",
#          "viewer_count":14971,
#          "started_at":"2020-10-27T14:12:59Z",
#          "language":"ru",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_buster-{width}x{height}.jpg",
#          "tag_ids":[
#             "0569b171-2a2b-476e-a596-5bdfb45a1327"
#          ]
#       },
#       {
#          "id":"39784058028",
#          "user_id":"40784764",
#          "user_name":"Shlorox",
#          "game_id":"509658",
#          "type":"live",
#          "title":"[GER|Shlorox] 120h Livestream mit Kamikatze und Nyy0 🐢 !wer !event | (╯°□°）#KaffeeStream | PC@60FPS [kw-com.de]",
#          "viewer_count":14674,
#          "started_at":"2020-10-26T16:33:52Z",
#          "language":"de",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_shlorox-{width}x{height}.jpg",
#          "tag_ids":[
#             "9166ad14-41f1-4b04-a3b8-c8eb838c6be6"
#          ]
#       },
#       {
#          "id":"39602135741",
#          "user_id":"181077473",
#          "user_name":"Gaules",
#          "game_id":"32399",
#          "type":"live",
#          "title":"NaVi vs OG BLAST Premier Fall Series 2020 @Gaules nas Redes Sociais !premio !prime !Sorteio PC Gamer",
#          "viewer_count":14153,
#          "started_at":"2020-10-27T14:43:07Z",
#          "language":"pt",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_gaules-{width}x{height}.jpg",
#          "tag_ids":[
#             "39ee8140-901a-4762-bfca-8260dea1310f"
#          ]
#       },
#       {
#          "id":"40240994126",
#          "user_id":"21841789",
#          "user_name":"Nmplol",
#          "game_id":"509658",
#          "type":"live",
#          "title":"Big Announcement Today!",
#          "viewer_count":12863,
#          "started_at":"2020-10-27T13:01:08Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_nmplol-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"40240526558",
#          "user_id":"139470326",
#          "user_name":"한동숙",
#          "game_id":"21779",
#          "type":"live",
#          "title":"롤 플레 갑니다",
#          "viewer_count":12480,
#          "started_at":"2020-10-27T11:00:28Z",
#          "language":"ko",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_handongsuk-{width}x{height}.jpg",
#          "tag_ids":[
#             "ab2975e3-b9ca-4b1a-a93e-fb61a5d5c3a4"
#          ]
#       },
#       {
#          "id":"40240901102",
#          "user_id":"31688366",
#          "user_name":"Symfuhny",
#          "game_id":"512710",
#          "type":"live",
#          "title":"[1240+ wins] $25,000 Mutineers Tourney w/ Tfue @2 PM PST | !loadout !vid.",
#          "viewer_count":11942,
#          "started_at":"2020-10-27T12:38:29Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_symfuhny-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039"
#          ]
#       },
#       {
#          "id":"39791208204",
#          "user_id":"24147592",
#          "user_name":"Gotaga",
#          "game_id":"518204",
#          "type":"live",
#          "title":"Grind FIFA PS4 !",
#          "viewer_count":11402,
#          "started_at":"2020-10-27T12:17:31Z",
#          "language":"fr",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_gotaga-{width}x{height}.jpg",
#          "tag_ids":[
#             "6f655045-9989-4ef7-8f85-1edcec42d648"
#          ]
#       }
#    ],
#    "pagination":{
#       "cursor":"eyJiIjp7IkN1cnNvciI6ImV5SnpJam8xTkRVNE9TNDRNamc0TkRNek1EVTNPQ3dpWkNJNlptRnNjMlVzSW5RaU9uUnlkV1Y5In0sImEiOnsiQ3Vyc29yIjoiZXlKeklqb3hNVFF3TWk0eE5EazJPVFV3TXpFME5ETXNJbVFpT21aaGJITmxMQ0owSWpwMGNuVmxmUT09In19"
#    }
# }


# Example 3 Request (get all live streams for 2+ user names):
curl -X GET 'https://api.twitch.tv/helix/streams?user_login=insomniac&user_login=maryle_mar' \
-H 'Authorization: Bearer <insert auth token here>' \
-H 'Client-Id: uclfmcq0ndx108y8d15vfxklrrb89k'

# Example 3 Response:
# { "data":[],"pagination":{} }
# {
#    "data":[
#       {
#          "id":"40210470030",
#          "user_id":"232672264",
#          "user_name":"Insomniac",
#          "game_id":"26936",
#          "type":"live",
#          "title":" FACTORY 93 Livestream (Encore)",
#          "viewer_count":931,
#          "started_at":"2020-10-25T01:55:24Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_insomniac-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "c5247b10-deec-4d7a-84a5-db6a75cb5908",
#             "2068d8f3-269c-43f2-9a00-82aeb3f0a3b8",
#             "9f1b01a8-87b9-4e25-94de-8705c1c1f4dc",
#             "338d7a92-8bcc-429e-a30c-9f1c41a2d79a",
#             "d81d54c8-d705-4df6-aaf0-01d715c1dbcc"
#          ]
#       },
#       {
#          "id":"40241146350",
#          "user_id":"521956563",
#          "user_name":"MaryLe_Mar",
#          "game_id":"26936",
#          "type":"live",
#          "title":"🎉🎉Lets Rave! Turn up your Wolume🔊 |  Techno wibes from Bali",
#          "viewer_count":132,
#          "started_at":"2020-10-27T13:35:37Z",
#          "language":"en",
#          "thumbnail_url":"https://static-cdn.jtvnw.net/previews-ttv/live_user_maryle_mar-{width}x{height}.jpg",
#          "tag_ids":[
#             "6ea6bca4-4712-4ab9-a906-e3336a9d8039",
#             "c553e849-7019-479b-a14d-a78cd3462e9a",
#             "338d7a92-8bcc-429e-a30c-9f1c41a2d79a",
#             "d81d54c8-d705-4df6-aaf0-01d715c1dbcc"
#          ]
#       }
#    ],
#    "pagination":{
      
#    }
# }




# Example 3 Request (get live stream url based on id, user_id, or game_id):
# - NOTE* some videos are only viewable to subscribers?! (by direct video ID url)
curl -X GET 'https://api.twitch.tv/helix/videos?user_id=521956563' \
-H 'Authorization: Bearer <insert auth token here>' \
-H 'Client-Id: uclfmcq0ndx108y8d15vfxklrrb89k'

# Example 3 Response:
# {
#    "data":[
#       {
#          "id":"783409017",
#          "user_id":"521956563",
#          "user_name":"MaryLe_Mar",
#          "title":"🎉🎉Lets Rave! Turn up your Wolume🔊 |  Techno wibes from Bali",
#          "description":"",
#          "created_at":"2020-10-27T13:35:47Z",
#          "published_at":"2020-10-27T13:35:47Z",
#          "url":"https://www.twitch.tv/videos/783409017",
#          "thumbnail_url":"",
#          "viewable":"public",
#          "view_count":0,
#          "language":"en",
#          "type":"archive",
#          "duration":"2h36m45s"
#       }
#    ],
#    "pagination":{
#       "cursor":"eyJiIjpudWxsLCJhIjp7Ik9mZnNldCI6MX19"
#    }
# }