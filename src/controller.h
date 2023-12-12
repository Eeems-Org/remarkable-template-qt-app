#pragma once

#include <QObject>
#include <QTimer>
#include <QQuickItem>
#include <epframebuffer.h>
/*!
 * \brief This class serves as a simple interop between QML and C++
 */
class Controller : public QObject {
    Q_OBJECT

public:
    Controller(QObject* parent) : QObject(parent) {}
    ~Controller(){}

    /*!
     * \brief Method called by QML after it's loaded to allow C++ to start interacting with the UI
     */
    Q_INVOKABLE void startup(){
        qDebug() << "Running controller startup";
        QTimer::singleShot(10, [this]{
            setState("loaded");
        });
    }
    /*!
     * \brief Gets the current state in QML
     * \return The current state
     */
    QString state() {
        if(stateControllerUI == nullptr && !getStateControllerUI()){
            return "loading";
        }
        return stateControllerUI->property("state").toString();
    }
    /*!
     * \brief Sets the current QML state
     * \param state The state to use
     */
    void setState(QString state){
        if(stateControllerUI == nullptr && !getStateControllerUI()){
            throw "Unable to find state controller";
        }
        stateControllerUI->setProperty("state", state);
    }
    /*!
     * \brief Change the root QObject for the QML
     * \param root The root QObject
     */
    void setRoot(QObject* root){ this->root = root; }

private:
    /*!
     * \brief The root QObject for the QML
     */
    QObject* root = nullptr;
    /*!
     * \brief The QML state controller
     */
    QObject* stateControllerUI = nullptr;
    /*!
     * \brief Find the QML state controller and cache it's value
     * \return The QML state controller QObject
     */
    QObject* getStateControllerUI(){
        stateControllerUI = root->findChild<QObject*>("stateController");
        return stateControllerUI;
    }
};
