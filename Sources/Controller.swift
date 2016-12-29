/**
* Copyright Michael McDonald 2016
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Kitura
import LoggerAPI

public class Controller {

  let router: Router

  init() throws {

    // All apps need a Router instance
    router = Router()

    // Respond to GAE start, stop, and health check requests
    router.all("/_ah/start", handler: start)
    router.all("/_ah/stop", handler: stop)
    router.all("/_ah/health", handler: health)

    // Basic GET request
    router.get("/hello", handler: getHello)
  }

  public func getHello(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("GET - /hello route handler...")
    response.headers["Content-Type"] = "text/plain; charset=utf-8"
    try response.status(.OK).send("Hello from Swift on GAE Flex!").end()
  }

  // GAE Flex Environment routes
  public func start(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    // Respond to GAE /_ah/start events, optional
    Log.debug("Responding to GAE /_ah/start event...")
  }

  public func stop(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    // Respond to GAE /_ah/stop events, optional
    Log.debug("Responding to GAE /_ah/stop event...")
  }

  public func health(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    // Respond to GAE /_ah/health events, mostly mandatory
    Log.debug("Responding to GAE /_ah/health event...")
    try response.send("OK").end()
  }
}
