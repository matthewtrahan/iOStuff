from bs4 import BeautifulSoup
import urllib2

base = "http://www.baseball-reference.com/"
players = "players/"
teams = "teams/"
seasons = "leagues/"
leaders = "leaders/"

teamAbbreviations = ["ARI", "ATL", "BAL", "BOS", "CHC", "CHW", "CIN", "CLE", "COL", "DET", "HOU", "KCR", \
	"ANA", "LAD", "FLA", "MIL", "MIN", "NYM", "NYY", "OAK", "PHI", "PIT", "SDP", "SFG", "SEA", "STL", "TBD", "TEX", "TOR", "WSN"]

teamsPage = urllib2.urlopen(base + teams)
teamSoup = BeautifulSoup(teamsPage)
print(teamSoup.prettify())