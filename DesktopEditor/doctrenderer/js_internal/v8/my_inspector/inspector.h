#ifndef V8_INSPECTOR_EXAMPLE_INSPECTOR_H
#define V8_INSPECTOR_EXAMPLE_INSPECTOR_H

#include <iostream>
#include <functional>
#include <vector>
#include <list>

#include "../../js_base.h"
#include "websocket_server.h"
#include "v8_inspector_client.h"
#include "utils.h"

class Inspector {
public:
	Inspector(NSJSBase::CJSContext* context, const std::string& script);

	void startAgent();
	bool isScriptRunning();
private:
	void onMessage(const std::string& message);
	void sendMessage(const std::string& message);
	int waitForFrontendMessage();

	int port_ = 8080;

	NSJSBase::CJSContext* jscontext_;
	v8::Handle<v8::Context> context_;
	std::unique_ptr<WebSocketServer> websocket_server_;
	std::unique_ptr<V8InspectorClientImpl> inspector_client_;
	const std::string& script_;
};


#endif //V8_INSPECTOR_EXAMPLE_INSPECTOR_H
