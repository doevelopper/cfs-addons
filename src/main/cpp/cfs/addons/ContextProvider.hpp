
#ifndef CFS_ADDONS_CONTEXTPROVIDER_HPP
#define CFS_ADDONS_CONTEXTPROVIDER_HPP

#include <memory>
#include <thread>
#include <vector>
#include <boost/asio.hpp>

namespace asio = boost::asio;

namespace cfs::addons
{

	class ContextProvider
	{
	 public:
   using Context = asio::io_service;
		ContextProvider();
		ContextProvider(const ContextProvider&) = default;
		ContextProvider(ContextProvider&&) = default;
		ContextProvider& operator=(const ContextProvider&) = default;
		ContextProvider& operator=(ContextProvider&&) = default;
		virtual ~ContextProvider();

  static ContextProvider& getInstance();

    Context& getContext();
    void run();
    void stopWork();
    void stop();
	 protected:
	 private:
   Context m_context;
   std::unique_ptr<Context::work> m_work;
   std::thread m_contextThread;
   static ContextProvider m_instance;
	};

}

#endif
