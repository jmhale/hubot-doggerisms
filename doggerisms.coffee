module.exports = (robot) ->

  robot.hear /(pupper|doggo|dogger)/i, (res) ->
    res.send "Woof!"
