# bot.py
# This file is intended to be a "getting started" code example for students.
# The code in this file is fully functional.
# Students are free to edit the code in the milestone 3 folder.
# Students are NOT allowed to distribute this code without the express permission of the class instructor
# IMPORTANT: How to set your secret environment variables? read README guidelines.

# imports
import os
import discord
import database as db

# environment variables
token = os.environ['DISCORD_TOKEN']
server = os.environ['DISCORD_GUILD']
server_id = os.environ['SERVER_ID']  # optional
channel_id = os.environ['CHANNEL_ID']  # optional

# database connection
# secret keys related to your database must be updated. Otherwise, it won't work
db_conn = db.connect()
# bot events
client = discord.Client()

cursor = db_conn.cursor()

@client.event
async def on_ready():
    """
    This method triggers with the bot connects to the server
    Note that the sample implementation here only prints the
    welcome message on the IDE console, not on Discord
    :return: VOID
    """
    print("{} has joined the server".format(client.user.name))

@client.event
async def on_message(message):
    """
    This method triggers when a user sends a message in any of your Discord server channels
    :param message: the message from the user. Note that this message is passed automatically by the Discord API
    :return: VOID
    """
    response = None  # will save the response from the bot
    if message.author == client.user:
        return  # the message was sent by the bot
    if message.type is discord.MessageType.new_member:
        response = "Welcome {}".format(
            message.author)  # a new member joined the server. Welcome him.
    else:
        # A message was send by the user.
        msg = message.content.lower()
        if msg[0] == '/':
            response = ""
            #commands start here
            msg = msg[1:len(msg)]
            msg = msg.split()
            if msg[0] == "art-price-in-range": #business rule 1
                try:
                    val1 = int(msg[1])
                    val2 = int(msg[2])
                    cursor.execute(f"SELECT name,price FROM artwork WHERE price BETWEEN {val1} and {val2} ORDER BY price ASC")
                    data = cursor.fetchall()
                    for art in data:
                        response += (art["name"] + "\t $" + str(art["price"]) + "\n")
                except:
                    response = "enter two integers for this command"

            elif msg[0] == "gallery-info":  # business rule 2
                name = ' '.join(msg[1:len(msg)])
                print(name)
                cursor.execute(f"SELECT id, name FROM gallery WHERE name LIKE '%{name}%'")
                id = cursor.fetchone()["id"]
                cursor.execute(f"SELECT * FROM artwork WHERE gallery={id} ORDER BY name ASC")
                artworks = cursor.fetchall()
                for art in artworks:
                    if(art["available"] == 1):
                        response += (art["name"] + "\t $" + str(art["price"]) + ": " + str(art["description"]) +"\n")

            elif msg[0] == "artist-by-price":  # business rule 3
                cursor.execute("SELECT artwork,artist FROM make")
                data = cursor.fetchall()
                cursor.execute("SELECT COUNT(id) FROM artist")
                numArtists = cursor.fetchone()["COUNT(id)"] # get total amount of artwork per artist
                avgs = []
                artists = []
                for artistID in range(numArtists):
                    cursor.execute(f"SELECT artwork FROM make WHERE artist={artistID}")
                    artistWork = cursor.fetchall()
                    total = 0
                    for arts in artistWork: #add all prices from artists works together, avg
                      cursor.execute(f"SELECT price FROM artwork WHERE id={arts['artwork']}")
                      total = total + int(cursor.fetchone()['price'])
                    avgs.append(total / len(artistWork))
                    cursor.execute(f"SELECT name FROM artist WHERE id={artistID}")
                    artists.append(cursor.fetchone())
              
                for i in range(len(avgs)):
                  response += f"{artists[i]['name']}: ${round(avgs[i],2)}\n"

            elif msg[0] == "gallery-by-genre":  # business rule 4
                ##### get a genre
                
                genre = msg[1]
                ### get its id
                cursor.execute(f"SELECT id,name FROM genre WHERE name like '%{genre}%'")
                genre = cursor.fetchone()
                genreID = genre["id"]
                genre = genre["name"]
                cursor.execute(f"SELECT COUNT(id) FROM gallery")
                numGalleries = cursor.fetchone()

                timeGenreAppearsInGallery = [0]*numGalleries['COUNT(id)']

                cursor.execute(f"SELECT * FROM artwork WHERE id IN (SELECT artwork FROM artwork_has_genre WHERE genre={genreID})") 
                
              
                artworks = cursor.fetchall()
                print(artworks)
                for artwork in artworks:
                    timeGenreAppearsInGallery[artwork['gallery']] += 1
                #response = str(genre) + " " + str(genreID)
                print(timeGenreAppearsInGallery)
                cursor.execute("SELECT * FROM gallery")
                galleries = cursor.fetchall()
                response = f"Times genre {genre} appears in each gallery:\n"
                for i in range(len(timeGenreAppearsInGallery)):
                    if timeGenreAppearsInGallery[i] > 0:
                        response += galleries[i]["name"] + ": " + str(timeGenreAppearsInGallery[i]) + "\n"

            elif msg[0] == "artwork-info":  # business rule 5
            # should enter an artwork name
                artName = ' '.join(msg[1:len(msg)])
                cursor.execute(f"SELECT * FROM artwork WHERE name LIKE '%{artName}%'")
                art = cursor.fetchone()
                description = art['description']
                cursor.execute(f"SELECT artist FROM make WHERE artwork={art['id']}")
                artists = cursor.fetchall()
                artistNames = []
                for artist in artists:
                    cursor.execute(f"SELECT name FROM artist WHERE id={artist['artist']}")
                    artistNames.append(cursor.fetchone()['name'])
                cursor.execute(f"SELECT genre FROM artwork_has_genre WHERE artwork={art['id']}")
                genres = cursor.fetchall()
                genreNames = []
                for genre in genres:
                    cursor.execute(f"SELECT name FROM genre WHERE id={genre['genre']}")
                    genreNames.append(cursor.fetchone()['name'])
                response = f"Name: {art['name']}\n Description: {art['description']} \nby: {artistNames}\ngenres: {genreNames}"

            elif msg[0] == "purchase-history-summary":  # business rule 6
                customer = msg[1]
                cursor.execute(f"SELECT id FROM artwork WHERE customer_id=(SELECT id FROM customer WHERE name LIKE '%{customer}%')")
                artworks = cursor.fetchall()
                cursor.execute("SELECT * FROM genre")
                genres = cursor.fetchall()
                customerGenreTaste = [0]*len(genres)
                for artwork in artworks:
                    cursor.execute(f"SELECT genre FROM artwork_has_genre WHERE artwork={artwork['id']}")
                    customerGenreTaste[cursor.fetchone()['genre']] += 1
                print(customerGenreTaste)

                cursor.execute("SELECT id,name FROM artist")
                artists = cursor.fetchall()
                customerArtistTaste = [0]*len(artists)
                for artwork in artworks:
                    cursor.execute(f"SELECT artist FROM make WHERE artwork={artwork['id']}")
                    authors = cursor.fetchall()
                    for author in authors:
                        customerArtistTaste[author['artist']] += 1
                print(customerArtistTaste)

                response = f"Summary of entered customer: {customer}\n"
                response += "Amount of genres: \n"
                for i in range(len(genres)):
                    if customerGenreTaste[i] != 0:
                        response += f"{genres[i]['name']}: {str(customerGenreTaste[i])} \n"
                response += "Amount of artists: \n"
                for i in range(len(artists)):
                    if customerArtistTaste[i] != 0:
                        response += f"{artists[i]['name']}: {str(customerArtistTaste[i])} \n"


                #respond with list of artists and how much they appear
                #and a list of genres and how much they appear in the order history
            elif msg[0] == "artist-by-art":  # business rule 7
                artName = ' '.join(msg[1:len(msg)])
                cursor.execute(f"SELECT * FROM artwork WHERE name LIKE '%{artName}%'")
                art = cursor.fetchone()
                cursor.execute(f"SELECT name FROM artist WHERE id IN(SELECT artist FROM make WHERE artwork={art['id']})")
                artists = cursor.fetchall()
                response = art['name'] + "by: \n"
                for artist in artists:
                    response += artist['name'] + "\n"
            
        if "milestone3" in msg:
            response = "I am alive. Signed: 'your bot'"
    if response:
        # bot sends response to the Discord API and the response is show
        # on the channel from your Discord server that triggered this method.
        embed = discord.Embed(description=response)
        await message.channel.send(embed=embed)


try:
    # start the bot and keep the above methods listening for new events
    client.run(token)
except:
    print(
        "Bot is offline because your secret environment variables are not set. Head to the left panel, "
        +
        "find the lock icon, and set your environment variables. For more details, read the README file in your "
        + "milestone 3 repository")
