local bigcat = {
  guideimg = nil,
  bodyimg = nil,
  headimg = nil,
  guidea = 0,
  bxy = {
    x = 473,
    y = 383
  },
  hxy = {
    x = 470,
    y = 100
  }
}
I.bigcat = bigcat

function bigcat:load()
  bigcat.guideimg = love.graphics.newImage('data/catte/guide.png')
  bigcat.bodyimg = love.graphics.newImage('data/catte/body.png')
  bigcat.headimg = love.graphics.newImage('data/catte/head.png')
end

function bigcat:draw()
  love.graphics.clear(255, 255, 255, 255)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(bigcat.bodyimg, bigcat.bxy.x, bigcat.bxy.y, 0, 1, 1, bigcat.bodyimg:getWidth()/2, 0)
  love.graphics.draw(bigcat.headimg, bigcat.hxy.x, bigcat.hxy.y, 0, 1, 1, bigcat.headimg:getWidth()/2, 0)
  love.graphics.setColor(100, 100, 255, bigcat.guidea)
  love.graphics.draw(bigcat.guideimg)
end

return bigcat
