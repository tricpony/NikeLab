//
//  MockJSON.swift
//  NikeLabUITests
//
//  Created by aarthur on 5/18/21.
//

import Foundation

let albumJSON = """
{\"id\":\"id\", \
\"artistName\":\"artistName\", \
\"name\":\"name\", \
\"copyright\":\"copyright\", \
\"releaseDate\":\"releaseDate\", \
\"artworkUrl100\":\"artworkUrl\", \
\"artistUrl\":\"artistUrl\",
\"genres\": [{\"genreId\":\"id\",\"name\":\"genre name\"}, {\"genreId\":\"id\",\"name\":\"genre name\"}] \
}
"""

let albumsJSON = """
[ \
{\"id\":\"id\", \
\"artistName\":\"artistName\", \
\"name\":\"name\", \
\"copyright\":\"copyright\", \
\"releaseDate\":\"releaseDate\", \
\"artworkUrl100\":\"artworkUrl\", \
\"artistUrl\":\"artistUrl\",
\"genres\": [{\"genreId\":\"id\",\"name\":\"genre name\"}]
},
{\"id\":\"id\", \
\"artistName\":\"artistName\", \
\"name\":\"name\", \
\"copyright\":\"copyright\", \
\"releaseDate\":\"releaseDate\", \
\"artworkUrl100\":\"artworkUrl\", \
\"artistUrl\":\"artistUrl\",
\"genres\": [{\"genreId\":\"id\",\"name\":\"genre name\"}] \
}]
"""

