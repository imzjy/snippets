import urllib2
import tornado.httpserver
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("index.html")
        
    def post(self):
        req = self.request
        url = req.arguments["input-url"][0].strip()
        if(not 
           (url.startswith("http://") or url.startswith("https://"))):
            url = "http://" + url
        
        f = urllib2.urlopen(url)
        self.write(f.read())
        
        
application = tornado.web.Application([
  (r"/", MainHandler),
])

if __name__ == "__main__":
    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8080)
    tornado.ioloop.IOLoop.instance().start()
