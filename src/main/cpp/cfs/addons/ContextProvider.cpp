
#include <cfs/addons/ContextProvider.hpp>

using namespace cfs::addons;

ContextProvider ContextProvider::m_instance;

ContextProvider::ContextProvider()
{

}

ContextProvider::~ContextProvider()
{
  stop();
}

ContextProvider& ContextProvider::getInstance()
{
  return m_instance;
}

void ContextProvider::run()
{

  m_context.reset();
  auto ctx_run = [this] { m_context.run(); };
  m_work = std::make_unique<Context::work>(m_context);
  m_contextThread = std::move(std::thread{ctx_run});

}

void ContextProvider::stopWork()
{

  if (m_work != nullptr)
  {
    m_work.reset(nullptr);
  }
  else
  {
    //"Work has already been stopped!");
  }
}

void ContextProvider::stop()
{
  stopWork();
  if (m_contextThread.joinable())
  {
    //"Joining context thread");
    m_context.stop();
    m_contextThread.join();
    //("Context thread terminated!");
  }
}
