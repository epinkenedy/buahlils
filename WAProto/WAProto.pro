syntax = "proto3";
package proto;

/// WhatsApp Version: 2.3000.1028742310

message ADVDeviceIdentity {
    optional uint32 rawId = 1;
    optional uint64 timestamp = 2;
    optional uint32 keyIndex = 3;
    optional ADVEncryptionType accountType = 4;
    optional ADVEncryptionType deviceType = 5;
}

enum ADVEncryptionType {
    E2EE = 0;
    HOSTED = 1;
}
message ADVKeyIndexList {
    optional uint32 rawId = 1;
    optional uint64 timestamp = 2;
    optional uint32 currentIndex = 3;
    repeated uint32 validIndexes = 4 [packed=true];
    optional ADVEncryptionType accountType = 5;
}

message ADVSignedDeviceIdentity {
    optional bytes details = 1;
    optional bytes accountSignatureKey = 2;
    optional bytes accountSignature = 3;
    optional bytes deviceSignature = 4;
}

message ADVSignedDeviceIdentityHMAC {
    optional bytes details = 1;
    optional bytes hmac = 2;
    optional ADVEncryptionType accountType = 3;
}

message ADVSignedKeyIndexList {
    optional bytes details = 1;
    optional bytes accountSignature = 2;
    optional bytes accountSignatureKey = 3;
}

message AIQueryFanout {
    optional MessageKey messageKey = 1;
    optional Message message = 2;
    optional int64 timestamp = 3;
}

message AIRichResponseCodeMetadata {
    optional string codeLanguage = 1;
    repeated AIRichResponseCodeBlock codeBlocks = 2;
    message AIRichResponseCodeBlock {
        optional AIRichResponseCodeMetadata.AIRichResponseCodeHighlightType highlightType = 1;
        optional string codeContent = 2;
    }
    
    enum AIRichResponseCodeHighlightType {
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_DEFAULT = 0;
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_KEYWORD = 1;
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_METHOD = 2;
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_STRING = 3;
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_NUMBER = 4;
        AI_RICH_RESPONSE_CODE_HIGHLIGHT_COMMENT = 5;
    }
}

message AIRichResponseContentItemsMetadata {
    repeated AIRichResponseContentItemMetadata itemsMetadata = 1;
    optional ContentType contentType = 2;
    message AIRichResponseContentItemMetadata {
        oneof aIRichResponseContentItem {
            AIRichResponseContentItemsMetadata.AIRichResponseReelItem reelItem = 1;
        }
    }
    
    message AIRichResponseReelItem {
        optional string title = 1;
        optional string profileIconUrl = 2;
        optional string thumbnailUrl = 3;
        optional string videoUrl = 4;
    }
    
    enum ContentType {
        DEFAULT = 0;
        CAROUSEL = 1;
    }
}

message AIRichResponseDynamicMetadata {
    optional AIRichResponseDynamicMetadataType type = 1;
    optional uint64 version = 2;
    optional string url = 3;
    optional uint32 loopCount = 4;
    enum AIRichResponseDynamicMetadataType {
        AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_UNKNOWN = 0;
        AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_IMAGE = 1;
        AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_GIF = 2;
    }
}

message AIRichResponseGridImageMetadata {
    optional AIRichResponseImageURL gridImageUrl = 1;
    repeated AIRichResponseImageURL imageUrls = 2;
}

message AIRichResponseImageURL {
    optional string imagePreviewUrl = 1;
    optional string imageHighResUrl = 2;
    optional string sourceUrl = 3;
}

message AIRichResponseInlineImageMetadata {
    optional AIRichResponseImageURL imageUrl = 1;
    optional string imageText = 2;
    optional AIRichResponseImageAlignment alignment = 3;
    optional string tapLinkUrl = 4;
    enum AIRichResponseImageAlignment {
        AI_RICH_RESPONSE_IMAGE_LAYOUT_LEADING_ALIGNED = 0;
        AI_RICH_RESPONSE_IMAGE_LAYOUT_TRAILING_ALIGNED = 1;
        AI_RICH_RESPONSE_IMAGE_LAYOUT_CENTER_ALIGNED = 2;
    }
}

message AIRichResponseLatexMetadata {
    optional string text = 1;
    repeated AIRichResponseLatexExpression expressions = 2;
    message AIRichResponseLatexExpression {
        optional string latexExpression = 1;
        optional string url = 2;
        optional double width = 3;
        optional double height = 4;
        optional double fontHeight = 5;
        optional double imageTopPadding = 6;
        optional double imageLeadingPadding = 7;
        optional double imageBottomPadding = 8;
        optional double imageTrailingPadding = 9;
    }
    
}

message AIRichResponseMapMetadata {
    optional double centerLatitude = 1;
    optional double centerLongitude = 2;
    optional double latitudeDelta = 3;
    optional double longitudeDelta = 4;
    repeated AIRichResponseMapAnnotation annotations = 5;
    optional bool showInfoList = 6;
    message AIRichResponseMapAnnotation {
        optional uint32 annotationNumber = 1;
        optional double latitude = 2;
        optional double longitude = 3;
        optional string title = 4;
        optional string body = 5;
    }
    
}

message AIRichResponseMessage {
    optional AIRichResponseMessageType messageType = 1;
    repeated AIRichResponseSubMessage submessages = 2;
    optional AIRichResponseUnifiedResponse unifiedResponse = 3;
    optional ContextInfo contextInfo = 4;
}

enum AIRichResponseMessageType {
    AI_RICH_RESPONSE_TYPE_UNKNOWN = 0;
    AI_RICH_RESPONSE_TYPE_STANDARD = 1;
}
message AIRichResponseSubMessage {
    optional AIRichResponseSubMessageType messageType = 1;
    optional AIRichResponseGridImageMetadata gridImageMetadata = 2;
    optional string messageText = 3;
    optional AIRichResponseInlineImageMetadata imageMetadata = 4;
    optional AIRichResponseCodeMetadata codeMetadata = 5;
    optional AIRichResponseTableMetadata tableMetadata = 6;
    optional AIRichResponseDynamicMetadata dynamicMetadata = 7;
    optional AIRichResponseLatexMetadata latexMetadata = 8;
    optional AIRichResponseMapMetadata mapMetadata = 9;
    optional AIRichResponseContentItemsMetadata contentItemsMetadata = 10;
}

enum AIRichResponseSubMessageType {
    AI_RICH_RESPONSE_UNKNOWN = 0;
    AI_RICH_RESPONSE_GRID_IMAGE = 1;
    AI_RICH_RESPONSE_TEXT = 2;
    AI_RICH_RESPONSE_INLINE_IMAGE = 3;
    AI_RICH_RESPONSE_TABLE = 4;
    AI_RICH_RESPONSE_CODE = 5;
    AI_RICH_RESPONSE_DYNAMIC = 6;
    AI_RICH_RESPONSE_MAP = 7;
    AI_RICH_RESPONSE_LATEX = 8;
    AI_RICH_RESPONSE_CONTENT_ITEMS = 9;
}
message AIRichResponseTableMetadata {
    repeated AIRichResponseTableRow rows = 1;
    optional string title = 2;
    message AIRichResponseTableRow {
        repeated string items = 1;
        optional bool isHeading = 2;
    }
    
}

message AIRichResponseUnifiedResponse {
    optional bytes data = 1;
}

message AIThreadInfo {
    optional AIThreadServerInfo serverInfo = 1;
    optional AIThreadClientInfo clientInfo = 2;
    message AIThreadClientInfo {
        optional AIThreadType type = 1;
        enum AIThreadType {
            UNKNOWN = 0;
            DEFAULT = 1;
            INCOGNITO = 2;
        }
    }
    
    message AIThreadServerInfo {
        optional string title = 1;
    }
    
}

message Account {
    optional string lid = 1;
    optional string username = 2;
    optional string countryCode = 3;
    optional bool isUsernameDeleted = 4;
}

message ActionLink {
    optional string url = 1;
    optional string buttonTitle = 2;
}

message AutoDownloadSettings {
    optional bool downloadImages = 1;
    optional bool downloadAudio = 2;
    optional bool downloadVideo = 3;
    optional bool downloadDocuments = 4;
}

message AvatarUserSettings {
    optional string fbid = 1;
    optional string password = 2;
}

message BizAccountLinkInfo {
    optional uint64 whatsappBizAcctFbid = 1;
    optional string whatsappAcctNumber = 2;
    optional uint64 issueTime = 3;
    optional HostStorageType hostStorage = 4;
    optional AccountType accountType = 5;
    enum AccountType {
        ENTERPRISE = 0;
    }
    enum HostStorageType {
        ON_PREMISE = 0;
        FACEBOOK = 1;
    }
}

message BizAccountPayload {
    optional VerifiedNameCertificate vnameCert = 1;
    optional bytes bizAcctLinkInfo = 2;
}

message BizIdentityInfo {
    optional VerifiedLevelValue vlevel = 1;
    optional VerifiedNameCertificate vnameCert = 2;
    optional bool signed = 3;
    optional bool revoked = 4;
    optional HostStorageType hostStorage = 5;
    optional ActualActorsType actualActors = 6;
    optional uint64 privacyModeTs = 7;
    optional uint64 featureControls = 8;
    enum ActualActorsType {
        SELF = 0;
        BSP = 1;
    }
    enum HostStorageType {
        ON_PREMISE = 0;
        FACEBOOK = 1;
    }
    enum VerifiedLevelValue {
        UNKNOWN = 0;
        LOW = 1;
        HIGH = 2;
    }
}

message BotAgeCollectionMetadata {
    optional bool ageCollectionEligible = 1;
    optional bool shouldTriggerAgeCollectionOnClient = 2;
    optional AgeCollectionType ageCollectionType = 3;
    enum AgeCollectionType {
        O18_BINARY = 0;
        WAFFLE = 1;
    }
}

message BotAvatarMetadata {
    optional uint32 sentiment = 1;
    optional string behaviorGraph = 2;
    optional uint32 action = 3;
    optional uint32 intensity = 4;
    optional uint32 wordCount = 5;
}

message BotCapabilityMetadata {
    repeated BotCapabilityType capabilities = 1;
    enum BotCapabilityType {
        UNKNOWN = 0;
        PROGRESS_INDICATOR = 1;
        RICH_RESPONSE_HEADING = 2;
        RICH_RESPONSE_NESTED_LIST = 3;
        AI_MEMORY = 4;
        RICH_RESPONSE_THREAD_SURFING = 5;
        RICH_RESPONSE_TABLE = 6;
        RICH_RESPONSE_CODE = 7;
        RICH_RESPONSE_STRUCTURED_RESPONSE = 8;
        RICH_RESPONSE_INLINE_IMAGE = 9;
        WA_IG_1P_PLUGIN_RANKING_CONTROL = 10;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_1 = 11;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_2 = 12;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_3 = 13;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_4 = 14;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_5 = 15;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_6 = 16;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_7 = 17;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_8 = 18;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_9 = 19;
        WA_IG_1P_PLUGIN_RANKING_UPDATE_10 = 20;
        RICH_RESPONSE_SUB_HEADING = 21;
        RICH_RESPONSE_GRID_IMAGE = 22;
        AI_STUDIO_UGC_MEMORY = 23;
        RICH_RESPONSE_LATEX = 24;
        RICH_RESPONSE_MAPS = 25;
        RICH_RESPONSE_INLINE_REELS = 26;
        AGENTIC_PLANNING = 27;
        ACCOUNT_LINKING = 28;
        STREAMING_DISAGGREGATION = 29;
        RICH_RESPONSE_GRID_IMAGE_3P = 30;
        RICH_RESPONSE_LATEX_INLINE = 31;
        QUERY_PLAN = 32;
        PROACTIVE_MESSAGE = 33;
        RICH_RESPONSE_UNIFIED_RESPONSE = 34;
        PROMOTION_MESSAGE = 35;
        SIMPLIFIED_PROFILE_PAGE = 36;
        RICH_RESPONSE_SOURCES_IN_MESSAGE = 37;
        RICH_RESPONSE_SIDE_BY_SIDE_SURVEY = 38;
        RICH_RESPONSE_UNIFIED_TEXT_COMPONENT = 39;
        AI_SHARED_MEMORY = 40;
        RICH_RESPONSE_UNIFIED_SOURCES = 41;
        RICH_RESPONSE_UNIFIED_DOMAIN_CITATIONS = 42;
        RICH_RESPONSE_UR_INLINE_REELS_ENABLED = 43;
        RICH_RESPONSE_UR_MEDIA_GRID_ENABLED = 44;
        RICH_RESPONSE_UR_TIMESTAMP_PLACEHOLDER = 45;
        RICH_RESPONSE_IN_APP_SURVEY = 46;
        AI_RESPONSE_MODEL_BRANDING = 47;
    }
}

message BotFeedbackMessage {
    optional MessageKey messageKey = 1;
    optional BotFeedbackKind kind = 2;
    optional string text = 3;
    optional uint64 kindNegative = 4;
    optional uint64 kindPositive = 5;
    optional ReportKind kindReport = 6;
    optional SideBySideSurveyMetadata sideBySideSurveyMetadata = 7;
    enum BotFeedbackKind {
        BOT_FEEDBACK_POSITIVE = 0;
        BOT_FEEDBACK_NEGATIVE_GENERIC = 1;
        BOT_FEEDBACK_NEGATIVE_HELPFUL = 2;
        BOT_FEEDBACK_NEGATIVE_INTERESTING = 3;
        BOT_FEEDBACK_NEGATIVE_ACCURATE = 4;
        BOT_FEEDBACK_NEGATIVE_SAFE = 5;
        BOT_FEEDBACK_NEGATIVE_OTHER = 6;
        BOT_FEEDBACK_NEGATIVE_REFUSED = 7;
        BOT_FEEDBACK_NEGATIVE_NOT_VISUALLY_APPEALING = 8;
        BOT_FEEDBACK_NEGATIVE_NOT_RELEVANT_TO_TEXT = 9;
        BOT_FEEDBACK_NEGATIVE_PERSONALIZED = 10;
        BOT_FEEDBACK_NEGATIVE_CLARITY = 11;
        BOT_FEEDBACK_NEGATIVE_DOESNT_LOOK_LIKE_THE_PERSON = 12;
        BOT_FEEDBACK_NEGATIVE_HALLUCINATION_INTERNAL_ONLY = 13;
        BOT_FEEDBACK_NEGATIVE = 14;
    }
    enum BotFeedbackKindMultipleNegative {
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_GENERIC = 1;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_HELPFUL = 2;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_INTERESTING = 4;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_ACCURATE = 8;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_SAFE = 16;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_OTHER = 32;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_REFUSED = 64;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_VISUALLY_APPEALING = 128;
        BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_RELEVANT_TO_TEXT = 256;
    }
    enum BotFeedbackKindMultiplePositive {
        BOT_FEEDBACK_MULTIPLE_POSITIVE_GENERIC = 1;
    }
    enum ReportKind {
        NONE = 0;
        GENERIC = 1;
    }
    message SideBySideSurveyMetadata {
        optional string selectedRequestId = 1;
        optional uint32 surveyId = 2;
        optional string simonSessionFbid = 3;
        optional string responseOtid = 4;
        optional string responseTimestampMsString = 5;
        optional bool isSelectedResponsePrimary = 6;
        optional string messageIdToEdit = 7;
        optional SideBySideSurveyAnalyticsData analyticsData = 8;
        optional SidebySideSurveyMetaAiAnalyticsData metaAiAnalyticsData = 9;
        message SideBySideSurveyAnalyticsData {
            optional string tessaEvent = 1;
            optional string tessaSessionFbid = 2;
        }
        
        message SidebySideSurveyMetaAiAnalyticsData {
            optional uint32 surveyId = 1;
            optional string primaryResponseId = 2;
            optional string testArmName = 3;
            optional string timestampMsString = 4;
            optional SideBySideSurveyCTAImpressionEventData ctaImpressionEvent = 5;
            optional SideBySideSurveyCTAClickEventData ctaClickEvent = 6;
            optional SideBySideSurveyCardImpressionEventData cardImpressionEvent = 7;
            optional SideBySideSurveyResponseEventData responseEvent = 8;
            optional SideBySideSurveyAbandonEventData abandonEvent = 9;
            message SideBySideSurveyAbandonEventData {
                optional string abandonDwellTimeMsString = 1;
            }
            
            message SideBySideSurveyCTAClickEventData {
                optional bool isSurveyExpired = 1;
                optional string clickDwellTimeMsString = 2;
            }
            
            message SideBySideSurveyCTAImpressionEventData {
                optional bool isSurveyExpired = 1;
            }
            
            message SideBySideSurveyCardImpressionEventData {
            }
            
            message SideBySideSurveyResponseEventData {
                optional string responseDwellTimeMsString = 1;
            }
            
        }
        
    }
    
}

message BotImagineMetadata {
    optional ImagineType imagineType = 1;
    enum ImagineType {
        UNKNOWN = 0;
        IMAGINE = 1;
        MEMU = 2;
        FLASH = 3;
        EDIT = 4;
    }
}

message BotLinkedAccount {
    optional BotLinkedAccountType type = 1;
    enum BotLinkedAccountType {
        BOT_LINKED_ACCOUNT_TYPE_1P = 0;
    }
}

message BotLinkedAccountsMetadata {
    repeated BotLinkedAccount accounts = 1;
    optional bytes acAuthTokens = 2;
    optional int32 acErrorCode = 3;
}

message BotMediaMetadata {
    optional string fileSha256 = 1;
    optional string mediaKey = 2;
    optional string fileEncSha256 = 3;
    optional string directPath = 4;
    optional int64 mediaKeyTimestamp = 5;
    optional string mimetype = 6;
    optional OrientationType orientationType = 7;
    enum OrientationType {
        CENTER = 1;
        LEFT = 2;
        RIGHT = 3;
    }
}

message BotMemoryFact {
    optional string fact = 1;
    optional string factId = 2;
}

message BotMemoryMetadata {
    repeated BotMemoryFact addedFacts = 1;
    repeated BotMemoryFact removedFacts = 2;
    optional string disclaimer = 3;
}

message BotMemuMetadata {
    repeated BotMediaMetadata faceImages = 1;
}

message BotMessageOrigin {
    optional BotMessageOriginType type = 1;
    enum BotMessageOriginType {
        BOT_MESSAGE_ORIGIN_TYPE_AI_INITIATED = 0;
    }
}

message BotMessageOriginMetadata {
    repeated BotMessageOrigin origins = 1;
}

message BotMessageSharingInfo {
    optional BotMetricsEntryPoint botEntryPointOrigin = 1;
    optional uint32 forwardScore = 2;
}

message BotMetadata {
    optional BotAvatarMetadata avatarMetadata = 1;
    optional string personaId = 2;
    optional BotPluginMetadata pluginMetadata = 3;
    optional BotSuggestedPromptMetadata suggestedPromptMetadata = 4;
    optional string invokerJid = 5;
    optional BotSessionMetadata sessionMetadata = 6;
    optional BotMemuMetadata memuMetadata = 7;
    optional string timezone = 8;
    optional BotReminderMetadata reminderMetadata = 9;
    optional BotModelMetadata modelMetadata = 10;
    optional string messageDisclaimerText = 11;
    optional BotProgressIndicatorMetadata progressIndicatorMetadata = 12;
    optional BotCapabilityMetadata capabilityMetadata = 13;
    optional BotImagineMetadata imagineMetadata = 14;
    optional BotMemoryMetadata memoryMetadata = 15;
    optional BotRenderingMetadata renderingMetadata = 16;
    optional BotMetricsMetadata botMetricsMetadata = 17;
    optional BotLinkedAccountsMetadata botLinkedAccountsMetadata = 18;
    optional BotSourcesMetadata richResponseSourcesMetadata = 19;
    optional bytes aiConversationContext = 20;
    optional BotPromotionMessageMetadata botPromotionMessageMetadata = 21;
    optional BotModeSelectionMetadata botModeSelectionMetadata = 22;
    optional BotQuotaMetadata botQuotaMetadata = 23;
    optional BotAgeCollectionMetadata botAgeCollectionMetadata = 24;
    optional string conversationStarterPromptId = 25;
    optional string botResponseId = 26;
    optional BotSignatureVerificationMetadata verificationMetadata = 27;
    optional BotUnifiedResponseMutation unifiedResponseMutation = 28;
    optional BotMessageOriginMetadata botMessageOriginMetadata = 29;
    optional InThreadSurveyMetadata inThreadSurveyMetadata = 30;
    optional AIThreadInfo botThreadInfo = 31;
    optional bytes internalMetadata = 999;
}

enum BotMetricsEntryPoint {
    UNDEFINED_ENTRY_POINT = 0;
    FAVICON = 1;
    CHATLIST = 2;
    AISEARCH_NULL_STATE_PAPER_PLANE = 3;
    AISEARCH_NULL_STATE_SUGGESTION = 4;
    AISEARCH_TYPE_AHEAD_SUGGESTION = 5;
    AISEARCH_TYPE_AHEAD_PAPER_PLANE = 6;
    AISEARCH_TYPE_AHEAD_RESULT_CHATLIST = 7;
    AISEARCH_TYPE_AHEAD_RESULT_MESSAGES = 8;
    AIVOICE_SEARCH_BAR = 9;
    AIVOICE_FAVICON = 10;
    AISTUDIO = 11;
    DEEPLINK = 12;
    NOTIFICATION = 13;
    PROFILE_MESSAGE_BUTTON = 14;
    FORWARD = 15;
    APP_SHORTCUT = 16;
    FF_FAMILY = 17;
    AI_TAB = 18;
    AI_HOME = 19;
    AI_DEEPLINK_IMMERSIVE = 20;
    AI_DEEPLINK = 21;
    META_AI_CHAT_SHORTCUT_AI_STUDIO = 22;
    UGC_CHAT_SHORTCUT_AI_STUDIO = 23;
    NEW_CHAT_AI_STUDIO = 24;
    AIVOICE_FAVICON_CALL_HISTORY = 25;
    ASK_META_AI_CONTEXT_MENU = 26;
    ASK_META_AI_CONTEXT_MENU_1ON1 = 27;
    ASK_META_AI_CONTEXT_MENU_GROUP = 28;
    INVOKE_META_AI_1ON1 = 29;
    INVOKE_META_AI_GROUP = 30;
    META_AI_FORWARD = 31;
    NEW_CHAT_AI_CONTACT = 32;
    MESSAGE_QUICK_ACTION_1_ON_1_CHAT = 33;
    MESSAGE_QUICK_ACTION_GROUP_CHAT = 34;
    ATTACHMENT_TRAY_1_ON_1_CHAT = 35;
    ATTACHMENT_TRAY_GROUP_CHAT = 36;
}
message BotMetricsMetadata {
    optional string destinationId = 1;
    optional BotMetricsEntryPoint destinationEntryPoint = 2;
    optional BotMetricsThreadEntryPoint threadOrigin = 3;
}

enum BotMetricsThreadEntryPoint {
    AI_TAB_THREAD = 1;
    AI_HOME_THREAD = 2;
    AI_DEEPLINK_IMMERSIVE_THREAD = 3;
    AI_DEEPLINK_THREAD = 4;
    ASK_META_AI_CONTEXT_MENU_THREAD = 5;
}
message BotModeSelectionMetadata {
    repeated BotUserSelectionMode mode = 1;
    enum BotUserSelect
