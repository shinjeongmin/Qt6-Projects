#ifndef MUSICCHARTSEARCHMODEL_H
#define MUSICCHARTSEARCHMODEL_H

#include <QAbstractListModel>
#include <QQmlEngine>
#include <QNetworkAccessManager>
#include "MusicItemData.h"

#include <QUrlQuery>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QString>

#include <QDebug>

class MusicItemData;

class MusicChartSearchModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool isSearching READ isSearching  WRITE setIsSearching  NOTIFY isSearchingChanged FINAL)

public:
    enum Role{
        MusicName = Qt::UserRole + 1,
        MusicSinger,
        MusicImageSource,
    };

    explicit MusicChartSearchModel(QObject *parent = nullptr);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

    bool isSearching() const;
    void setIsSearching(bool newIsSearching);

public slots:
    void search(const QString &name);
    void parseData();

signals:
    void isSearchingChanged();
private:
    QHash<int, QByteArray> m_names;

    const QString requestDefaultUrl = "https://itunes.apple.com/search";
    QNetworkAccessManager m_networkManager;
    QNetworkReply *m_reply = nullptr;

    QList<MusicItemData*> m_musicList;
    bool m_isSearching = false;
};

#endif // MUSICCHARTSEARCHMODEL_H
