#include "MusicChartSearchModel.h"

MusicChartSearchModel::MusicChartSearchModel(QObject *parent)
    : QAbstractListModel{parent}
{
    m_names[MusicName] = "musicName";
    m_names[MusicSinger] = "musicSinger";
    m_names[MusicImageSource] = "musicImageSource";
}

int MusicChartSearchModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_musicList.size();
}

QVariant MusicChartSearchModel::data(const QModelIndex &index, int role) const
{
    if(index.isValid() && index.row() >= 0 && index.row() < m_musicList.size()){
        MusicItemData* musicItem = m_musicList[index.row()];

        switch(role){
        case MusicName:
            return musicItem->title();
        case MusicSinger:
            return musicItem->singerName();
        case MusicImageSource:
            return musicItem->imageSource();
        default:
            return {};
        }
    }

    return {};
}

QHash<int, QByteArray> MusicChartSearchModel::roleNames() const
{
    return m_names;
}

bool MusicChartSearchModel::isSearching() const
{
    return m_isSearching;
}

void MusicChartSearchModel::setIsSearching(bool newIsSearching)
{
    if (m_isSearching == newIsSearching)
        return;
    m_isSearching = newIsSearching;
    emit isSearchingChanged();
}

void MusicChartSearchModel::search(const QString &name)
{
    QUrlQuery query;
    QString songName = name;

    songName.replace(" ", "+");
    query.addQueryItem("term", songName);
    query.addQueryItem("limit", "25");

    qDebug() << "query:" << requestDefaultUrl + "?" + query.toString();

    setIsSearching(true);
    m_reply = m_networkManager.get(QNetworkRequest(requestDefaultUrl + "?" + query.toString()));
    connect(m_reply, &QNetworkReply::finished, this, &MusicChartSearchModel::parseData);
}

void MusicChartSearchModel::parseData()
{
    if(m_reply->error() == QNetworkReply::NoError){
        beginResetModel();

        if(!m_musicList.empty()){
            qDeleteAll(m_musicList);
            m_musicList.clear();
        }

        QByteArray data = m_reply->readAll();

        QJsonDocument jsonDocument = QJsonDocument::fromJson(data);
        int resultCount = jsonDocument["resultCount"].toInt();

        if(resultCount > 0){
            QJsonArray results = jsonDocument["results"].toArray();

            for(const auto &result : results){
                QJsonObject item = result.toObject();

                MusicItemData* musicItem = new MusicItemData(this);

                musicItem->setTitle(item["trackName"].toString());
                musicItem->setSingerName(item["artistName"].toString());
                musicItem->setImageSource(item["artworkUrl100"].toString());

                m_musicList << musicItem;
            }
        }
        else{
            // Empty
        }

        endResetModel();
    } else {
        // Error!
        qDebug() << "Error:" << m_reply->errorString();
    }

    setIsSearching(false);
    m_reply->deleteLater();
    m_reply = nullptr;
}
