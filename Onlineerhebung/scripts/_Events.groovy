import groovy.xml.StreamingMarkupBuilder
import grails.util.GrailsUtil

eventWebXmlEnd = {String tmpfile ->

		def root = new XmlSlurper().parse(webXmlFile)

		switch (GrailsUtil.environment) {
				case "development":
						// create session-config with session-timeout if not exists
						if (root.'session-config'.isEmpty()) {
								root.appendNode { 'session-config' { 'session-timeout'(180) } }
						}
						break
				case "production":
						// create session-config with session-timeout if not exists
						if (root.'session-config'.isEmpty()) {
								root.appendNode { 'session-config' { 'session-timeout'(180) } }
						}
						break
		}

		webXmlFile.text = new StreamingMarkupBuilder().bind {
				mkp.declareNamespace("": "http://java.sun.com/xml/ns/j2ee")
				mkp.yield(root)
		}
}